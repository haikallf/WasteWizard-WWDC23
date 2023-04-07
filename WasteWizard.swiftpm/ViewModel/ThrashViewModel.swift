//
//  File.swift
//  
//
//  Created by Haikal Lazuardi on 06/04/23.
//

import SwiftUI

class ThrashViewModel: ObservableObject {
    @Published var currentThrash: Thrash?
    @Published var currentPosition = initialPosition
    @Published var highlightedId: Int?
    @Published var draggableThrashOpacity: CGFloat = 1.0
    @Published var isGameOver: Bool = false
    private(set) var attempts = 0
    
    private static let initialPosition = CGPoint(
        x: UIScreen.main.bounds.midX,
        y: UIScreen.main.bounds.maxY - 100
    )
    
    private var frames: [Int: CGRect] = [:]
    
    private var thrashes = Array(Thrash.all.shuffled().prefix(upTo: 3))
    var thrashContainer = Thrash.all.shuffled()
    
    func startGame() {
        currentThrash = thrashes.popLast()
    }
    
    func nextRound() {
        currentThrash = thrashes.popLast()
        
        if (currentThrash == nil) {
            gameOver()
        } else {
            prepareNextRound()
        }
    }
    
    func gameOver() {
        isGameOver = true
    }
    
    func prepareNextRound() {
        withAnimation {
            thrashContainer.shuffle()
        }
        
        withAnimation(.none) {
            resetPosition()
            withAnimation {
                draggableThrashOpacity = 1.0
            }
        }
    }
    
    func restartGame() {
        thrashes = Array(Thrash.all.shuffled().prefix(upTo: 3))
        attempts = 0
        nextRound()
    }
    
    func update(frame: CGRect, for id: Int) {
        frames[id] = frame
    }
    
    func update(dragPosition: CGPoint) {
        currentPosition = dragPosition
        
        // Detects if the draggable item touching the container
        for (id, frame) in frames where (frame.contains(dragPosition)) {
            highlightedId = id
            return
        }
        highlightedId = nil
        
    }
    
    func confirmDrop() {
        defer { highlightedId = nil }
        
        guard let highlightedId = highlightedId else {
            resetPosition()
            return
        }
        
        if (highlightedId == currentThrash?.id) {
            guard let frame = frames[highlightedId] else {
                return
            }
            currentPosition = CGPoint(x: frame.midX, y: frame.midY)
            draggableThrashOpacity = 0
            nextRound()
        } else {
            resetPosition()
        }
        attempts += 1
    }
    
    func resetPosition() {
        currentPosition = ThrashViewModel.initialPosition
    }
    
    func isHighlighted(id: Int) -> Bool {
        return highlightedId == id
    }
}


