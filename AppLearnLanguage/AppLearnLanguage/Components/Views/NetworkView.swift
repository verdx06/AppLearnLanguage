//
//  NetworkView.swift
//  AppLearnLanguage
//
//  Created by Виталий Багаутдинов on 27.03.2025.
//

import SwiftUI

struct NetworkView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Spacer()
            Image("emoj")
            Text("No\ninternet connection")
                .multilineTextAlignment(.center)
                .fredokaFont(size: 30, font: .medium)
            Spacer()
            Button {
                checkConnection()
            } label: {
                Text("Check again")
            }.buttonStyle(MainButtonStyle())
                .padding(.horizontal)
            
        }.header("")
    }
    private func checkConnection() {
        if NetworkModel.instance.isConnected {
            dismiss() 
        }
    }
}

#Preview {
    NetworkView()
}
