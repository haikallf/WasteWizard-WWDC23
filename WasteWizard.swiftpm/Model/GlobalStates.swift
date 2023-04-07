//
//  File.swift
//  
//
//  Created by Haikal Lazuardi on 08/04/23.
//

import SwiftUI
import Foundation

class GlobalStates: ObservableObject {
    @Published var isLandScape: Bool = false
    
    func getFont(weight: String, size: CGFloat) -> Font {
        let cfURL = Bundle.main.url(forResource: "Poppins-\(weight)", withExtension: "ttf")! as CFURL

        CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)

        let uiFont = UIFont(name: "Poppins-\(weight)", size:  size)

        return Font(uiFont ?? UIFont())
    }
}
