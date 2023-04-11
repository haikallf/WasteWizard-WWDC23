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
    var height: CGFloat
    var isLandscape: Bool
    
    var body: some View {
        VStack {
            Image(trivia.filename)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: height)
                .foregroundColor(trivia.color)
                .padding(.top, 100)
            
            Text(trivia.title.uppercased())
                .font(globalStates.getFont(weight: "Bold", size: isLandscape ? 40 : 44))
                .foregroundColor(Color("darkGreen"))
                .padding(.top, 60)
            
            Text(trivia.text)
                .font(globalStates.getFont(weight: "Regular", size: isLandscape ? 24 : 28))
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
        TriviaAdapter(trivia: Trivia.all.first!, height: 700.0, isLandscape: false).environmentObject(GlobalStates())
    }
}
