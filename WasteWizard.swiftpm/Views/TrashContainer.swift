//
//  SwiftUIView.swift
//  
//
//  Created by Haikal Lazuardi on 06/04/23.
//

import SwiftUI

struct TrashContainer: View {
    let trash: Trash
    @ObservedObject var viewModel: TrashViewModel
    private let size: CGFloat = 150
    private let highlightedSize: CGFloat = 220
    
    var body: some View {
        ZStack {
            Image(trash.filename)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(trash.color)
                .frame(height: size)
                .overlay {
                    GeometryReader { proxy -> Color in
                        viewModel.update(
                            frame: proxy.frame(in: .global),
                            for: trash.id
                        )
                        
                        return Color.clear
                    }
                }
            if (viewModel.isHighlighted(id: trash.id)) {
                Circle()
                    .fill(trash.color)
                    .opacity(0.2)
                    .frame(width: highlightedSize, height: highlightedSize)
            }
        }
        .frame(width: highlightedSize, height: highlightedSize)
        
    }
}

struct TrashContainer_Previews: PreviewProvider {
    static var previews: some View {
        TrashContainer(trash: Trash.all.first!, viewModel: TrashViewModel())
    }
}
