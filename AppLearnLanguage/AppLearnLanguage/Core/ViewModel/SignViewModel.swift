//
//  SignViewModel.swift
//  AppLearnLanguage
//
//  Created by Виталий Багаутдинов on 26.03.2025.
//

import Foundation
import Alamofire

struct AuthResponse: Decodable {
    let user: User
    
    struct User: Decodable {
        let id: String
    }
}

final class SignViewModel: ObservableObject {
    @Published var Firstname: String = "name"
    @Published var Lastname: String = "name"
    @Published var email: String = ""

    @Published var password: String = "Vit3ch!"
    @Published var confirmPassword: String = "Vit3ch!"
    @Published var isCheckBox: Bool = false
    
    @Published var isNavigate: Bool = false
    @Published var isProgress: Bool = false
    
    func signup() {
        Task {
            await MainActor.run {
                self.isProgress = true
                self.isNavigate = false
            }
            
            APIManager.instance.signup(firstname: Firstname, lastname: Lastname, email: email, password: password, name: Firstname) { result in
                Task { @MainActor in
                    self.isProgress = false
                    self.isNavigate = result
                }
            }
        }
    }
    
    func signin() {
        Task {
            await MainActor.run {
                self.isProgress = true
                self.isNavigate = false
            }
            APIManager.instance.signin(login: email, password: password) { result in
                Task { @MainActor in
                    self.isProgress = false
                    self.isNavigate = result
                }
            }
        }
    }
    
    func checkSignup() -> Bool {
        let checkbox = isCheckBox
        let count = password.count >= 8
        let low = password.contains { $0.isLowercase }
        let up = password.contains { $0.isUppercase }
        let digit = password.contains { $0.isNumber }
        let symb = password.rangeOfCharacter(from: .symbols) != nil ||
        password.rangeOfCharacter(from: .punctuationCharacters) != nil
        
        return checkbox && count && low && up && digit && symb
    }
}
