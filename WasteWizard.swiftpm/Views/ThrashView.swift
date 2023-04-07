//
//  SwiftUIView.swift
//  
//
//  Created by Haikal Lazuardi on 06/04/23.
//

import SwiftUI

struct ThrashView: View {
    @StateObject private var viewModel = ThrashViewModel()

    let gridItems = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { state in
                viewModel.update(dragPosition: state.location)
            }
            .onEnded { state in
                viewModel.update(dragPosition: state.location)
                viewModel.confirmDrop()
            }
    }
    
    var body: some View {
        ZStack {
            LazyVGrid(columns: gridItems, spacing: 100) {
                ForEach(viewModel.thrashContainer, id: \.id) { thrash in
                    ThrashContainer(thrash: thrash, viewModel: viewModel)
                }
            }
            DraggableThrash(thrash: viewModel.currentThrash, position: viewModel.currentPosition, gesture: drag)
        }
        
    }
}

struct ThrashView_Previews: PreviewProvider {
    static var previews: some View {
        ThrashView()
    }
}
