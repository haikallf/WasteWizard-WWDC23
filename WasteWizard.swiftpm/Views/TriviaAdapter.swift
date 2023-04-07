//
//  SwiftUIView.swift
//  
//
//  Created by Haikal Lazuardi on 08/04/23.
//

import SwiftUI

struct TriviaAdapter: View {
    @EnvironmentObject var globalStates: GlobalStates
    var trivia: Trivia
    
    var body: some View {
        VStack {
            
            Image(systemName: "trash.fill")
                .resizable()
                .frame(width: 250, height: 300)
                .foregroundColor(trivia.color)
                .padding(.top, 400)
            
            Text(trivia.title.uppercased())
                .font(globalStates.getFont(weight: "Bold", size: 48))
                .foregroundColor(Color(red: 103/255, green: 116/255, blue: 62/255))
                .padding(.top, 60)
            
            Text(trivia.text)
                .font(globalStates.getFont(weight: "Regular", size: 32))
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .foregroundColor(.brown)
                .padding(.top, -30)
        }
        .padding([.leading, .trailing], 100)
    }
}

struct TriviaAdapter_Previews: PreviewProvider {
    static var previews: some View {
        TriviaAdapter(trivia: Trivia.all.first!).environmentObject(GlobalStates())
    }
}
