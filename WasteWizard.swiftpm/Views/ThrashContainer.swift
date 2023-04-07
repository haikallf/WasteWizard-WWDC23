//
//  SwiftUIView.swift
//  
//
//  Created by Haikal Lazuardi on 06/04/23.
//

import SwiftUI

struct ThrashContainer: View {
    let thrash: Thrash
    @ObservedObject var viewModel: ThrashViewModel
    private let size: CGFloat = 100
    private let highlightedSize: CGFloat = 120
    
    var body: some View {
        ZStack {
            Circle()
                .fill(thrash.color)
                .frame(width: size, height: size)
                .overlay {
                    GeometryReader { proxy -> Color in
                        viewModel.update(
                            frame: proxy.frame(in: .global),
                            for: thrash.id
                        )
                        
                        return Color.clear
                    }
                }
            if (viewModel.isHighlighted(id: thrash.id)) {
                Circle()
                    .fill(thrash.color)
                    .opacity(0.5)
                    .frame(width: highlightedSize, height: highlightedSize)
            }
        }
        .frame(width: highlightedSize, height: highlightedSize)
        
    }
}

struct ThrashContainer_Previews: PreviewProvider {
    static var previews: some View {
        ThrashContainer(thrash: Thrash.all.first!, viewModel: ThrashViewModel())
    }
}
