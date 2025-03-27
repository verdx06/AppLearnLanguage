//
//  SignupView.swift
//  AppLearnLanguage
//
//  Created by Виталий Багаутдинов on 26.03.2025.
//

import SwiftUI

struct PasswordView: View {
    
    let email: String
    let firstName: String
    let lastName: String
    
    @ObservedObject var svm = SignViewModel()
    @State var isConnected: Bool = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Text("Choose a Password")
                    .fredokaFont(size: 22, font: .medium)
                    .padding()
                
                CustomTextField(name: "Password", example: "Your First Name", text: $svm.password, security: true)
                CustomTextField(name: "Confirm Password", example: "Your Last Name", text: $svm.confirmPassword, security: true)
                    .padding(.bottom)
                
                VStack {
                    HStack(spacing: 0) {
                        Button {
                            svm.isCheckBox.toggle()
                        } label: {
                            Image("checkbox")
                        }
                        Text("  I ")
                            .fredokaFont(size: 17)
                        NavigationLink {
                            PDFKitView()
                        } label: {
                            Text("have made myself acquainted with")
                                .fredokaFont(size: 17)
                        }
                    }
                    HStack(spacing: 0) {
                        NavigationLink {
                            PDFKitView()
                        } label: {
                            Text("the Rules")
                                .fredokaFont(size: 17)
                        }
                        Text(" and accept all its provisions,")
                            .fredokaFont(size: 17)
                    }
                }
                
                Button {
                    if svm.checkSignup() {
                        svm.signup()
                    }
                } label: {
                    Text("Signup")
                }.buttonStyle(MainButtonStyle(isProgress: svm.isProgress))
                    .padding(.top)
                
                HStack(spacing: 0){
                    Text("Already you member?")
                        .fredokaFont(size: 17)
                        .foregroundStyle(Color.grayDark)
                    NavigationLink {
                        //
                    } label: {
                        Text(" Signup")
                            .fredokaFont(size: 17, font: .medium)
                    }
                    
                }.padding(.top)
                
                Spacer(minLength: 170)
            }
            .modifier(NetworkModifier(isConnecting: $isConnected))
            .onAppear(perform: {
                svm.email = email
                svm.Firstname = firstName
                svm.Lastname = lastName
            })
            .navigationDestination(isPresented: $svm.isNavigate, destination: {
                ProfileView()
            })
            .padding(.horizontal)
            .header("Signup") {
                dismiss()
            }
        }
    }
}

#Preview {
    PasswordView(email: "", firstName: "", lastName: "")
}
