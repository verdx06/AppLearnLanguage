//
//  SignupView.swift
//  AppLearnLanguage
//
//  Created by Виталий Багаутдинов on 26.03.2025.
//

import SwiftUI
import Foundation

extension SignupView {
    final class ViewModel: ObservableObject {
        @Published var Firstname: String = ""
        @Published var Lastname: String = ""
        @Published var email: String = ""
        
        @Published var password: String = ""
        @Published var confirmPassword: String = ""
        
        @Published var isLoading: Bool = false
        
        func signup() {
            
        }
    }
}
