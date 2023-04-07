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
    private let size: CGFloat = 100
    private let highlightedSize: CGFloat = 120
    
    var body: some View {
        ZStack {
            Circle()
                .fill(trash.color)
                .frame(width: size, height: size)
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
                    .opacity(0.5)
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
