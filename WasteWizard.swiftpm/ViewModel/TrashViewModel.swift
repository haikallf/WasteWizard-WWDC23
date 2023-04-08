//
//  File.swift
//  
//
//  Created by Haikal Lazuardi on 06/04/23.
//

import SwiftUI

class TrashViewModel: ObservableObject {
    @Published var currentTrash: Trash?
    @Published var currentPosition = initialPosition
    @Published var highlightedId: Int?
    @Published var draggableTrashOpacity: CGFloat = 1.0
    @Published var isGameOver: Bool = false
    @Published var isWrongTrashBin: Bool = false
    private(set) var attempts = 0
    
    private static let initialPosition = CGPoint(
        x: UIScreen.main.bounds.midX,
        y: UIScreen.main.bounds.maxY - 200
    )
    
    private var frames: [Int: CGRect] = [:]
    
    private var trashes = Array(Trash.all.shuffled().prefix(upTo: 5))
    var trashContainer = Trash.all.shuffled()
    
    func startGame() {
        currentTrash = trashes.popLast()
    }
    
    func nextRound() {
        currentTrash = trashes.popLast()
        
        if (currentTrash == nil) {
            gameOver()
        } else {
            prepareNextRound()
        }
    }
    
    func gameOver() {
        isGameOver = true
    }
    
    func prepareNextRound() {
        withAnimation(.none) {
            resetPosition()
            withAnimation {
                draggableTrashOpacity = 1.0
            }
        }
    }
    
    func restartGame() {
        trashes = Array(Trash.all.shuffled().prefix(upTo: 5))
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
            wrongTrashBin()
            return
        }
        highlightedId = nil
        
    }
    
    func wrongTrashBin() {
        if (currentTrash?.id != highlightedId) {
            isWrongTrashBin = true
        } else {
            isWrongTrashBin = false
        }
    }
    
    func confirmDrop() {
        defer { highlightedId = nil }
        
        guard let highlightedId = highlightedId else {
            resetPosition()
            return
        }
        
        wrongTrashBin()
        if (highlightedId == currentTrash?.id) {
            guard let frame = frames[highlightedId] else {
                return
            }
            currentPosition = CGPoint(x: frame.midX, y: frame.midY)
            draggableTrashOpacity = 0
            nextRound()
        } else {
            resetPosition()
        }
        attempts += 1
    }
    
    func resetPosition() {
        currentPosition = TrashViewModel.initialPosition
    }
    
    func isHighlighted(id: Int) -> Bool {
        return highlightedId == id
    }
}


