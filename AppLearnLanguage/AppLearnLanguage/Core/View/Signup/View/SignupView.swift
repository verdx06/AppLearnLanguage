//
//  SignupView.swift
//  AppLearnLanguage
//
//  Created by Виталий Багаутдинов on 26.03.2025.
//

import SwiftUI

struct SignupView: View {
    
    @StateObject var svm = SignViewModel()
    @State var isConnected = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Text("Create an Account")
                    .fredokaFont(size: 22, font: .medium)
                    .padding()
                
                CustomTextField(name: "First Name", example: "Your First Name", text: $svm.Firstname)
                CustomTextField(name: "Last Name", example: "Your Last Name", text: $svm.Lastname)
                CustomTextField(name: "Email Address", example: "Email", text: $svm.email)
                    .padding(.bottom)
                
                Button {
                    if !svm.Firstname.isEmpty && !svm.Lastname.isEmpty && !svm.email.isEmpty {
                        svm.isNavigate = true
                    }
                } label: {
                    Text("Continue")
                }.buttonStyle(MainButtonStyle())
                    .padding(.top)
                
                HStack(spacing: 0){
                    Text("Already you member?")
                        .fredokaFont(size: 17)
                        .foregroundStyle(Color.grayDark)
                    NavigationLink {
                        LoginView()
                    } label: {
                        Text(" Login")
                            .fredokaFont(size: 17, font: .medium)
                    }
                    
                }.padding(.top)
                
                Spacer(minLength: 170)
            }
            .navigationDestination(isPresented: $svm.isNavigate, destination: {
                PasswordView(email: svm.email, firstName: svm.Firstname, lastName: svm.Lastname)
            })
            .modifier(NetworkModifier(isConnecting: $isConnected))
            .padding(.horizontal)
                .header("Signup")
        }
    }
}

#Preview {
    SignupView()
}
