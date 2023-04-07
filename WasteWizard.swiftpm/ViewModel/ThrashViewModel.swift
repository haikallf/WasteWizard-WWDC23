//
//  File.swift
//  
//
//  Created by Haikal Lazuardi on 06/04/23.
//

import SwiftUI

class ThrashViewModel: ObservableObject {
    let currentThrash = Thrash(id: 1, color: .green)
    @Published var currentPosition = initialPosition
    @Published var highlightedId: Int?
    
    private static let initialPosition = CGPoint(
        x: UIScreen.main.bounds.midX,
        y: UIScreen.main.bounds.maxY - 100
    )
    
    private var frames: [Int: CGRect] = [:]
    
    var thrashContainer = Thrash.all
    
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
        resetPosition()
        highlightedId = nil
    }
    
    func resetPosition() {
        currentPosition = ThrashViewModel.initialPosition
    }
    
    func isHighlighted(id: Int) -> Bool {
        return highlightedId == id
    }
}


