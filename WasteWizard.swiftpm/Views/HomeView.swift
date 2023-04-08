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
            VStack {
                Image(systemName: "trash.fill")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .foregroundColor(Color("lightGreen"))
                
                Text("Waste Wizard")
                    .font(globalStates.getFont(weight: "Bold", size: 80.0))
                    .foregroundColor(Color("darkGreen"))
                    .font(.system(size: 80))
                
                HStack {
                    NavigationLink(destination: TrashView()) {
                        Text("Play")
                            .padding()
                            .background(Color("primaryGreen"))
                            .foregroundColor(.white)
                            .font(.system(size: 32))
                            .cornerRadius(15)
                            .padding(.trailing, 20)
                            
                    }
                    
                    NavigationLink(destination: TriviaView()) {
                        Text("Trivia")
                            .padding()
                            .background(Color("primaryGreen"))
                            .foregroundColor(.white)
                            .font(.system(size: 32))
                            .cornerRadius(15)
                            .padding(.leading, 20)
                    }
                }
                .padding()
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
