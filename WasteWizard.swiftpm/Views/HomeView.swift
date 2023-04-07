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
                    .foregroundColor(Color(red: 199/255, green: 222/255, blue: 87/255))
                
                Text("Waste Wizard")
                    .font(globalStates.getFont(weight: "Bold", size: 80.0))
                    .foregroundColor(Color(red: 103/255, green: 116/255, blue: 62/255))
                    .font(.system(size: 80))
                
                HStack {
                    NavigationLink(destination: TrashView()) {
                        Text("Play")
                            .padding()
                            .background(Color(red: 127/255, green: 178/255, blue: 109/255))
                            .foregroundColor(.white)
                            .font(.system(size: 32))
                            .cornerRadius(15)
                            .padding(.trailing, 20)
                            
                    }
                    
                    NavigationLink(destination: TriviaView()) {
                        Text("Trivia")
                            .padding()
                            .background(Color(red: 127/255, green: 178/255, blue: 109/255))
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
