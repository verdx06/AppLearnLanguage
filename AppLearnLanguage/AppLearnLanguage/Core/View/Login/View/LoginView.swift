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
    @State var isConnected: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            Image("login")
            Text("For free, join now and\nstart learning")
                .multilineTextAlignment(.center)
                .fredokaFont(size: 22, font: .medium)
            CustomTextField(name: "Login", example: "Login", text: $svm.email)
            CustomTextField(name: "Password", example: "Password", text: $svm.password, security: true)
            HStack {
                Text("Forgot Password")
                    .fredokaFont(size: 15)
                    .foregroundStyle(Color.customRed)
                Spacer()
            }.padding(.horizontal)
                .padding(.top, 5)
                .padding(.bottom)
            Button {
                svm.signin()
            } label: {
                Text("Confirm")
            }.buttonStyle(MainButtonStyle(isProgress: svm.isProgress))

            HStack(spacing: 0){
                Text("Not you member?")
                    .fredokaFont(size: 17)
                    .foregroundStyle(Color.grayDark)
                NavigationLink {
                    SignupView()
                } label: {
                    Text(" Signup")
                        .fredokaFont(size: 17, font: .medium)
                }
                
            }.padding(.top)
            
            Spacer(minLength: 180)
        }.ignoresSafeArea(.keyboard)
        .fullScreenCover(isPresented: $svm.isNavigate, content: {
            ProfileView()
        })
        .padding(.horizontal)
        .modifier(NetworkModifier(isConnecting: $isConnected))
        .header("Login") {
            dismiss()
        }
    }
}

#Preview {
    LoginView()
}
