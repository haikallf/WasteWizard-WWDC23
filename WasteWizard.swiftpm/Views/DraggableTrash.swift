//
//  DraggableTrash.swift
//  WasteWizard
//
//  Created by Haikal Lazuardi on 06/04/23.
//

import SwiftUI

struct DraggableTrash<Draggable: Gesture>: View {
    let trash: Trash
    
    private let size: CGFloat = 100
    let position: CGPoint
    let gesture: Draggable
    
    
    
    var body: some View {
        Image(trash.waste)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: size)
            .shadow(radius: 10)
            .position(position)
            .gesture(gesture)
    }
}

struct DraggableTrash_Previews: PreviewProvider {
    static var previews: some View {
        DraggableTrash(trash: Trash.all.first!, position: CGPoint(x: 100, y: 100),
                        gesture: DragGesture())
    }
}
