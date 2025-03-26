//
//  CustomTextField.swift
//  AppLearnLanguage
//
//  Created by Виталий Багаутдинов on 26.03.2025.
//

import SwiftUI

struct CustomTextField: View {
    
    let name: String
    let example: String
    
    @Binding var text: String
    
    var body: some View {
        VStack {
            HStack {
                Text(name)
                    .fredokaFont(size: 15)
                Spacer()
            }
            ZStack {
                TextField("", text: $text)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(.backgroundTextField)
                    )
                HStack {
                    if text.isEmpty {
                        Text(example)
                            .fredokaFont(size: 15)
                            .foregroundStyle(.backgroundText)
                            .padding(.horizontal)
                    }
                    Spacer()
                }
            }
        }
    }
}
