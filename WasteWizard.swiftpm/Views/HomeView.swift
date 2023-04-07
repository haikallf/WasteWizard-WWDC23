//
//  SwiftUIView.swift
//  
//
//  Created by Haikal Lazuardi Fadil on 07/04/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "trash.fill")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.blue)
                Text("Waste Wizard")
                    .font(.system(size: 84))
                    .fontWeight(.bold)
                
                HStack {
                    NavigationLink(destination: TrashView()) {
                        Text("Play")
                            .padding()
                            .background(.blue)
                            .foregroundColor(.white)
                            .font(.system(size: 32))
                            .cornerRadius(15)
                            .padding(.trailing, 20)
                            
                    }
                    
                    
                    NavigationLink(destination: TriviaView()) {
                        Text("Trivia")
                            .padding()
                            .background(.blue)
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
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
