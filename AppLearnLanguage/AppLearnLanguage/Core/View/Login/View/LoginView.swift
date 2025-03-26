//
//  LoginView.swift
//  AppLearnLanguage
//
//  Created by Виталий Багаутдинов on 26.03.2025.
//

import SwiftUI

struct LoginView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var svm = SignViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            CustomTextField(name: "Login", example: "Login", text: $svm.email)
            CustomTextField(name: "Password", example: "Password", text: $svm.password, security: true)
            Button {
                svm.signin()
            } label: {
                Text("Confirm")
            }.buttonStyle(MainButtonStyle(isProgress: svm.isProgress))

            Spacer()
        }.header("Login") {
            dismiss()
        }
    }
}

#Preview {
    LoginView()
}
