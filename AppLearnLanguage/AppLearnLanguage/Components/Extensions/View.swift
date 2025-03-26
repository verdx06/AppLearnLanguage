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
    
    func header(_ title: String, action: (() -> Void)? = nil) -> some View {
        ZStack(alignment: .top){
            HeaderView(header: title, action: action)
                .frame(height: 102)
            VStack {
                self
                    .padding(.top, 107)
            }
        }.edgesIgnoringSafeArea(.top)
            .navigationBarBackButtonHidden(true)
    }
    
}

