//
//  Text.swift
//  AppLearnLanguage
//
//  Created by Виталий Багаутдинов on 25.03.2025.
//

import Foundation
import SwiftUI

extension View {
    func fredokaFont(size: CGFloat, font: Font.Weight = .regular) -> some View {
        switch font {
        case .bold :
            self
                .font(.custom("Fredoka-Bold", size: size))
        case .light :
            self
                .font(.custom("Fredoka-Light", size: size))
        case .medium :
            self
                .font(.custom("Fredoka-Medium", size: size))
        default:
            self
                .font(.custom("Fredoka-Regular", size: size))
        }
    }
}

