//
//  Thrash.swift
//  
//
//  Created by Haikal Lazuardi on 06/04/23.
//

import SwiftUI

struct Thrash {
    let id: Int
    let color: Color
}

extension Thrash {
    static let all = [
        Thrash(id: 1, color: .green),
        Thrash(id: 2, color: .yellow),
        Thrash(id: 3, color: .red),
        Thrash(id: 4, color: .blue),
        Thrash(id: 5, color: .gray),
    ]
}
