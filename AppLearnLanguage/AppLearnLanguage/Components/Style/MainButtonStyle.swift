//
//  ButtonStyle.swift
//  AppLearnLanguage
//
//  Created by Виталий Багаутдинов on 25.03.2025.
//

import SwiftUI


struct MainButtonStyle: ButtonStyle {
    
    let isProgress: Bool
    
    init(isProgress: Bool = false) {
        self.isProgress = isProgress
    }
    
    func makeBody(configuration: Configuration) -> some View {
        if isProgress {
            ProgressView()
                .fredokaFont(size: 20, font: .medium)
                .foregroundStyle(Color.white)
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .background(Color.customblue)
                .cornerRadius(10)
                .opacity(configuration.isPressed ? 0.8 : 1.0)
                .padding(.horizontal)
        } else {
            configuration.label
                .fredokaFont(size: 20, font: .medium)
                .foregroundStyle(Color.white)
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .background(Color.customblue)
                .cornerRadius(10)
                .opacity(configuration.isPressed ? 0.8 : 1.0)
                .padding(.horizontal)
        }
        
    }
    
}

#Preview(body: {
    Button {
        //
    } label: {
        Text("Lol")
    }.buttonStyle(MainButtonStyle())

})
