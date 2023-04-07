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
                withAnimation {
                    viewModel.confirmDrop()
                }
            }
    }
    
    var body: some View {
        ZStack {
            LazyVGrid(columns: gridItems, spacing: 100) {
                ForEach(viewModel.thrashContainer, id: \.id) { thrash in
                    ThrashContainer(thrash: thrash, viewModel: viewModel)
                }
            }
            if let currentThrash = viewModel.currentThrash {
                DraggableThrash(thrash: currentThrash, position: viewModel.currentPosition, gesture: drag)
                    .opacity(viewModel.draggableThrashOpacity)
            }
        }
        .onAppear {
            viewModel.startGame()
        }
        .alert(
            Text("You won!"),
            isPresented: $viewModel.isGameOver,
            actions: {
                Button("Go to Home") {
                    print("Go to Home")
                }
                Button("Start Again") {
                    viewModel.restartGame()
                }
            },
            message: {
                Text("Attempt(s): \(viewModel.attempts)")
            }
        )
    }
}

struct ThrashView_Previews: PreviewProvider {
    static var previews: some View {
        ThrashView()
    }
}
