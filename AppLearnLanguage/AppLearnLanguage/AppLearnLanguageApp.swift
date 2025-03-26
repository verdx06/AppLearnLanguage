//
//  AppLearnLanguageApp.swift
//  AppLearnLanguage
//
//  Created by Виталий Багаутдинов on 25.03.2025.
//

import SwiftUI

@main
struct AppLearnLanguageApp: App {
    
    let lastWatched: String?
    
    init() {
        lastWatched = UserDefaults.standard.string(forKey: UserKey.lastWatched.rawValue)
    }
    
    var body: some Scene {
        WindowGroup {
            if lastWatched == "languageSelected" {
                SignupView()
            }
            else if lastWatched == "watched" {
                SelectLanguageView()
            } else {
                OnboardingView()
            }
        }
    }
}
