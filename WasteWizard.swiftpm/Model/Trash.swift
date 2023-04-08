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
    let waste: String
}

extension Trash {
    static let all = [
        Trash(id: 1, color: Color("primaryGreen"), filename: "Green-TrashBin", waste: "Green-Waste"),
        Trash(id: 2, color: Color("Yellow"), filename: "Yellow-TrashBin", waste: "Yellow-Waste"),
        Trash(id: 3, color: Color("Red"), filename: "Red-TrashBin", waste: "Red-Waste"),
        Trash(id: 4, color: Color("Blue"), filename: "Blue-TrashBin", waste: "Blue-Waste"),
        Trash(id: 5, color: Color("Gray"), filename: "Gray-TrashBin", waste: "Gray-Waste"),
    ]
}
