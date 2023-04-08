//
//  Trash.swift
//  
//
//  Created by Haikal Lazuardi on 06/04/23.
//

import SwiftUI

struct Trash {
    let id: Int
    let color: Color
    let filename: String
}

extension Trash {
    static let all = [
        Trash(id: 1, color: Color("primaryGreen"), filename: "Green-TrashBin"),
        Trash(id: 2, color: Color("Yellow"), filename: "Yellow-TrashBin"),
        Trash(id: 3, color: Color("Red"), filename: "Red-TrashBin"),
        Trash(id: 4, color: Color("Blue"), filename: "Blue-TrashBin"),
        Trash(id: 5, color: Color("Gray"), filename: "Gray-TrashBin"),
    ]
}
