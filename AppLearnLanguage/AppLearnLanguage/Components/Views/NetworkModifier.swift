//
//  NetworkModifier.swift
//  AppLearnLanguage
//
//  Created by Виталий Багаутдинов on 27.03.2025.
//

import SwiftUI

struct NetworkModifier: ViewModifier {
    
    @Binding var isConnecting: Bool
    
    
    func body(content: Content) -> some View {
        content
            .onReceive(NetworkModel.instance.$isConnected) { value in
                if !value {
                    withAnimation {
                        isConnecting = true
                    }
                }
            }
            .fullScreenCover(isPresented: $isConnecting, content: {
                NetworkView()
            })
    }
}
