//
//  SwiftUIView.swift
//  
//
//  Created by Haikal Lazuardi Fadil on 07/04/23.
//

import SwiftUI

struct HomeView: View {
    @State private var font: Font?
    @EnvironmentObject var globalStates: GlobalStates
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.white
                    .ignoresSafeArea()
                
                Image("HomeBg")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 600)
                        .foregroundColor(Color("lightGreen"))
                    
                    HStack {
                        NavigationLink(destination: TrashView()) {
                            Text("Play")
                                .padding()
                                .background(Color("primaryGreen"))
                                .foregroundColor(.white)
                                .font(globalStates.getFont(weight: "Regular", size: 32))
                                .cornerRadius(15)
                                .padding(.trailing, 20)
                        }
                        
                        NavigationLink(destination: TriviaView()) {
                            Text("Trivia")
                                .padding()
                                .background(Color("primaryGreen"))
                                .foregroundColor(.white)
                                .font(globalStates.getFont(weight: "Regular", size: 32))
                                .cornerRadius(15)
                                .padding(.leading, 20)
                        }
                    }
                    .padding()
                }
            }
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .accentColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(GlobalStates())
    }
}
