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
                
            if (viewModel.isHighlighted(id: trash.id)) {
//                Circle()
//                    .fill(trash.color)
//                    .opacity(0.2)
//                    .frame(width: highlightedSize, height: highlightedSize)
                
                if (viewModel.currentTrash?.id != trash.id) {
                    Image(systemName: "x.circle")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .foregroundColor(Color("Red"))
                        .shadow(radius: 4)
                } else {
                    Image(systemName: "checkmark.circle")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .foregroundColor(Color("primaryGreen"))
                        .shadow(radius: 4)
                }
            }
            Circle()
                .fill(trash.color)
                .opacity(0)
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
        }
        .frame(width: highlightedSize, height: highlightedSize)
//        .offset(x: viewModel.isWrongTrashBin && viewModel.highlightedId == trash.id ? -8 : 0)
//        .animation(Animation.default.repeatCount(3, autoreverses: true).speed(6))
        
    }
}

struct TrashContainer_Previews: PreviewProvider {
    static var previews: some View {
        TrashContainer(trash: Trash.all.first!, viewModel: TrashViewModel())
    }
}
