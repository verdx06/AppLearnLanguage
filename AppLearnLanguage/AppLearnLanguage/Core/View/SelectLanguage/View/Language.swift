//
//  Language.swift
//  AppLearnLanguage
//
//  Created by Виталий Багаутдинов on 25.03.2025.
//

import SwiftUI

struct Language: View {
    let text: String
    let isSelected: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: 67)
                .foregroundColor(isSelected ? Color.selectLanguage : Color.notSelectLanguage)
                .cornerRadius(12)
            
            Text(text)
                .fredokaFont(size: 22, font: .medium)
                .foregroundColor(isSelected ? .white : .primary)
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

#Preview {
    Language(text: "Russia", isSelected: true)
}
