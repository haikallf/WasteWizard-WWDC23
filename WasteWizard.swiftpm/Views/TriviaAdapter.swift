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
            Image(trivia.filename)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 700)
                .foregroundColor(trivia.color)
                .padding(.top, 100)
            
            Text(trivia.title.uppercased())
                .font(globalStates.getFont(weight: "Bold", size: 48))
                .foregroundColor(Color("darkGreen"))
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
