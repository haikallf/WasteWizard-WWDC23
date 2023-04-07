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
}

extension Trash {
    static let all = [
        Trash(id: 1, color: Color(red: 199/255, green: 222/255, blue: 87/255)),
        Trash(id: 2, color: .yellow),
        Trash(id: 3, color: .red),
        Trash(id: 4, color: .blue),
        Trash(id: 5, color: .gray),
    ]
}
