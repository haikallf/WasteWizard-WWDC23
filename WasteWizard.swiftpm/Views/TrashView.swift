//
//  SwiftUIView.swift
//  
//
//  Created by Haikal Lazuardi on 06/04/23.
//

import SwiftUI

struct TrashView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel = TrashViewModel()
    @EnvironmentObject var globalStates: GlobalStates

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
            Color.white
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Image(systemName: "chevron.backward")
                            Text("Back")
                            
                        }.foregroundColor(Color("darkGreen"))
                    }
                    Spacer()
                }
                Spacer()
            }.padding()
            
            LazyVGrid(columns: gridItems, spacing: 100) {
                ForEach(viewModel.trashContainer, id: \.id) { trash in
                    TrashContainer(trash: trash, viewModel: viewModel)
                }
            }
            if let currentTrash = viewModel.currentTrash {
                DraggableTrash(trash: currentTrash, position: viewModel.currentPosition, gesture: drag)
                    .opacity(viewModel.draggableTrashOpacity)
            }
            
            HStack {
                VStack (alignment: .leading) {
                    Text("Place the waste to the right trash can")
                        .font(globalStates.getFont(weight: "Bold", size: 36))
                        .foregroundColor(Color("darkGreen"))
                        .padding(.top, 100)
                        
                    Text("Attempt(s): \(viewModel.attempts)")
                        .font(globalStates.getFont(weight: "Regular", size: 24))
                        .foregroundColor(Color("darkGreen"))
                    
                    Text("Round(s): \(viewModel.rounds) / 5")
                        .font(globalStates.getFont(weight: "Regular", size: 24))
                        .foregroundColor(Color("darkGreen"))
                    Spacer()
                }
                Spacer()
            }
            .padding([.leading, .trailing], 36)
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            viewModel.startGame()
        }
        .alert(
            Text("You won!"),
            isPresented: $viewModel.isGameOver,
            actions: {
                Button(action : { self.presentationMode.wrappedValue.dismiss() }){
                        Text("Go to Home")
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

struct TrashView_Previews: PreviewProvider {
    static var previews: some View {
        TrashView().environmentObject(GlobalStates())
    }
}
