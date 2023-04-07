//
//  File.swift
//  
//
//  Created by Haikal Lazuardi Fadil on 07/04/23.
//

import SwiftUI

struct Trivia: Equatable {
    let id: Int
    let title: String
    let color: Color
    let text: String
}

extension Trivia {
    static let all = [
        Trivia(id: 1, title: "organic waste", color: Color(red: 199/255, green: 222/255, blue: 87/255), text: "A green waste bin is used to dispose of organic waste such as food scraps, leaves, or branches. Organic waste can be broken down by bacteria and turned into fertilizer for plants."),
        Trivia(id: 2, title: "metal waste", color: .yellow, text: "A yellow waste bin is used to dispose of metal waste such as beverage cans or electronics. This type of waste can be recycled and reused."),
        Trivia(id: 3, title: "hazardous waste", color: .red, text: "A red waste bin is usually used to dispose of hazardous waste such as batteries, drugs, or other hazardous chemicals. This type of waste requires special handling to prevent environmental pollution."),
        Trivia(id: 4, title: "paper waste", color: .blue, text: "A blue waste bin is used to dispose of paper or cardboard waste. This type of waste can be recycled and used as raw material for new paper products."),
        Trivia(id: 5, title: "non-recyclable waste", color: .black, text: "A black waste bin is used to dispose of waste that cannot be recycled or broken down, such as plastic or rubber. This type of waste is typically sent to a landfill or waste processing facility."),
    ]
}

