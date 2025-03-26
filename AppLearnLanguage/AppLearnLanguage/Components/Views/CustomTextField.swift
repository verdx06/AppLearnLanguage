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
    
    let security: Bool
    @State var eye: Bool
    
    init(name: String, example: String, text: Binding<String>, security: Bool = false, eye: Bool = false) {
        self.name = name
        self.example = example
        self._text = text
        self.security = security
        self.eye = eye
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(name)
                    .fredokaFont(size: 15)
                Spacer()
            }
            ZStack {
                if security && !eye {
                    SecureField("", text: $text)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundStyle(.backgroundTextField)
                        )
                } else {
                    TextField("", text: $text)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundStyle(.backgroundTextField)
                        )
                }
                HStack(spacing: 5){
                    if text.isEmpty {
                        if security {
                            ForEach(0..<7, id: \.self) { _ in
                                Image(systemName: "circle.fill")
                                    .resizable()
                                    .frame(width: 6, height: 6)
                                    .foregroundStyle(Color.grayDark.opacity(0.5))
                            }
                        } else {
                            Text(example)
                                .fredokaFont(size: 15)
                                .foregroundStyle(.backgroundText)
                        }
                    }
                    Spacer()
                    if security {
                        Button {
                            eye.toggle()
                        } label: {
                            Image("eye")
                        }

                    }
                }.padding(.horizontal)
            }
        }.padding(.horizontal)
        .padding(.top)
    }
}
