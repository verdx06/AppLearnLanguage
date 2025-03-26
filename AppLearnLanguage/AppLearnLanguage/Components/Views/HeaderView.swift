//
//  HeaderView.swift
//  AppLearnLanguage
//
//  Created by Виталий Багаутдинов on 25.03.2025.
//

import SwiftUI

struct HeaderView: View {
    let header: String
    let action: (() -> Void)?
    
    var body: some View {
        ZStack(alignment: .top) {
            // Фоновый прямоугольник
            Rectangle()
                .fill(Color.deppBlue)
                .frame(height: 102)
                .frame(maxWidth: .infinity)
            
            // Контент хедера
            HStack {
                if let action = action {
                    Button(action: action) {
                        Image("back")
                            .padding(8)
                    }
                } else {
                    Spacer()
                        .frame(width: 44) // Для выравнивания когда кнопки нет
                }
                
                Spacer()
                
                Text(header)
                    .fredokaFont(size: 17, font: .medium)
                    .foregroundColor(.white)
                    .lineLimit(1)
                
                
                
                // Две точки справа (заменяем на реальные элементы если нужно)
                HStack(spacing: 8) {
                    Circle()
                        .frame(width: 15, height: 15)
                        .foregroundColor(.deppBlue)
                    Circle()
                        .frame(width: 15, height: 15)
                        .foregroundColor(.deppBlue)
                }
                
                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.top, 56) // Учитываем safe area
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    HeaderView(header: "Language") {
        //
    }
}
