//
//  DraggableThrash.swift
//  WasteWizard
//
//  Created by Haikal Lazuardi on 06/04/23.
//

import SwiftUI

struct DraggableThrash<Draggable: Gesture>: View {
    let thrash: Thrash
    
    private let size: CGFloat = 100
    let position: CGPoint
    let gesture: Draggable
    
    
    
    var body: some View {
        Circle()
            .fill(thrash.color)
            .frame(width: size, height: size)
            .shadow(radius: 10)
            .position(position)
            .gesture(gesture)
    }
}

struct DraggableThrash_Previews: PreviewProvider {
    static var previews: some View {
        DraggableThrash(thrash: Thrash.all.first!, position: CGPoint(x: 100, y: 100),
                        gesture: DragGesture())
    }
}
