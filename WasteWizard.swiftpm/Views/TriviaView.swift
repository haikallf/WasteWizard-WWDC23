//
//  SwiftUIView.swift
//  
//
//  Created by Haikal Lazuardi Fadil on 07/04/23.
//

import SwiftUI

struct TriviaView: View {
    let trivia: [Trivia] = Trivia.all
    
    var body: some View {
        VStack {
            Text("Did you know that waste bins have many colors depending on their purpose?")
            
            Text("Generally, waste bin colors have specific meanings and purposes based on the type of waste to be disposed of. Here is an explanation of waste bin colors:")
            
            ForEach(trivia, id: \.id) { elmt in
                TriviaCard(color: elmt.color, text: elmt.text)
            }
            
            
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    Text("Trivia")
                      .font(.system(size: 40))
                      .foregroundColor(Color.black)
                }
            }
        }
    }
}

struct TriviaCard: View {
    let color: Color
    let text: String
    
    var body: some View {
        HStack {
            Image(systemName: "trash.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(color)
            
            Text("\(text)")
                .font(.system(size: 24))
                .padding(.leading, 10)
        }
        .padding()
        .background(.white)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(.gray, lineWidth: 2)
        )
    }
}

struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView()
    }
}
