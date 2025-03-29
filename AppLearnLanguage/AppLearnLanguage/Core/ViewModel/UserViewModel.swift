//
//  UserViewModel.swift
//  AppLearnLanguage
//
//  Created by Виталий Багаутдинов on 29.03.2025.
//

import Foundation


class UserViewModel: ObservableObject {
    
    let userData = UserDefaults.standard.array(forKey: "userData")
    
}
