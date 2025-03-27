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
    @Published var Firstname: String = ""
    @Published var Lastname: String = ""
    @Published var email: String = ""
    
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var isCheckBox: Bool = false
    
    @Published var isNavigate: Bool = false
    @Published var isProgress: Bool = false
    
    let URL = "https://phqazlwlbdljxgjhzlfl.supabase.co"
    let apiKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBocWF6bHdsYmRsanhnamh6bGZsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI0Njg1NjgsImV4cCI6MjA1ODA0NDU2OH0.G3PXfo5SsKtmNH4Ehf_12v4WUFiqpkpx08X579X1kXg"
    
    func signup() {
        
        self.isNavigate = false
        self.isProgress = true
        
        let headers: HTTPHeaders = [
            "apikey" : apiKey,
            "Authorization" : "Bearer \(apiKey)",
            "Content-type" : "application/json"
        ]
        
        let params: Parameters = [
            "email" : email,
            "password" : password
        ]
        
        
        AF.request(URL + "/auth/v1/signup", method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).validate().responseDecodable(of: AuthResponse.self) { response in
            switch response.result {
            case .success(let data):
                self.addUser(id: data.user.id)
            case .failure(let error):
                    print("signup: \(error)")
                self.isProgress = false
            }
        }
        
    }
    
    func addUser(id: String) {
        let headers: HTTPHeaders = [
            "apikey" : apiKey,
            "Authorization" : "Bearer \(apiKey)",
            "Content-type" : "application/json"
        ]
        
        let params: Parameters = [
            "id" : id,
            "email" : email,
            "firstname" : Firstname,
            "lastname" : Lastname
        ]
        
        AF.request(URL + "/rest/v1/users", method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).validate().response { response in
            switch response.result {
            case .success:
                self.isNavigate = true
                self.isProgress = false
            case .failure(let error):
                self.isNavigate = false
                self.isProgress = false
                print("addUser: \(error)")
            }
        }
    }
    
    func signin() {
        
        let headers: HTTPHeaders = [
            "apikey": apiKey,
            "Authorization": "Bearer \(apiKey)",
            "Content-Type": "application/json"
        ]
        
        let params: [String: Any] = [
            "email": email,
            "password": password
        ]
        
        // Важно: используем POST для /token с grant_type=password
        AF.request(URL + "/auth/v1/token?grant_type=password",
                  method: .post,
                  parameters: params,
                  encoding: JSONEncoding.default,
                  headers: headers)
        .validate()
        .response { response in
            switch response.result {
            case .success:
                print("Успешный вход! Токен")
            case .failure(let error):
                print("signin \(error)")
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
        
        return checkbox && low && up && digit && symb && count
    }
}
