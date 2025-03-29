//
//  APIManager.swift
//  AppLearnLanguage
//
//  Created by Виталий Багаутдинов on 29.03.2025.
//

import Foundation
import Alamofire


final class APIManager {
    
    static let instance = APIManager()
    
    let rest_api = "https://volantreaction-us.backendless.app/api/users/"
    let api_login = "login"
    let api_register = "register"
    
    func signup(firstname: String, lastname: String, email: String, password: String, name: String, compliction: @escaping (Bool) -> ()) {
        
        let params: Parameters = [
            "Firstname" : firstname,
            "Lastname" : lastname,
            "name" : name,
            "email" : email,
            "password" : password,
        ]
        
        AF.request(rest_api + api_register, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers()).validate().response { response in
            switch response.result {
            case .success:
                compliction(true)
            case .failure(let error):
                print(error.localizedDescription)
                compliction(false)
            }
        }
        
    }
    
    func signin(login: String, password: String, compliction: @escaping (Bool) -> ()) {
        
        let params: Parameters = [
            "login" : login,
            "password" : password
        ]
        
        AF.request(rest_api + api_login, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers()).validate().responseDecodable(of: UserModel.self) { response in
            switch response.result {
            case .success(let data):
                if response.response?.statusCode == 200 {
                    compliction(true)
                    UserDefaults.standard.set(data.name, forKey: "userName")
                    UserDefaults.standard.set(data.objectId, forKey: "userId")
                } else {
                    print(data)
                    compliction(false)
                }
            case .failure(let error):
                print(error.localizedDescription)
                compliction(false)
            }
        }
        
    }
    
    func headers() -> HTTPHeaders {
        return [
            .contentType("application/json"),
            .authorization(bearerToken: "72036410-3C04-4FF9-86CA-63CB19D83499")
        ]
    }
    
}
