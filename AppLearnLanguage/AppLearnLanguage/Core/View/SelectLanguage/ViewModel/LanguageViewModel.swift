//
//  LanguageViewModel.swift
//  AppLearnLanguage
//
//  Created by Виталий Багаутдинов on 26.03.2025.
//

import Foundation

extension SelectLanguageView {
    final class ViewModel: ObservableObject {
        
        let languageCode: [String:String] = [
            "ru" : "Russian",
            "en" : "English",
            "zh" : "Chinese",
            "be" : "Belarus",
            "kk" : "Kazakh"
        ]
        
        @Published var languages = ["Russian", "English", "Chinese", "Belarus", "Kazakh"]
        @Published var systemLanguage = Locale.current.language

        
    }
}
