//
//  LanguageViewModel.swift
//  AppLearnLanguage
//
//  Created by Виталий Багаутдинов on 26.03.2025.
//

import Foundation

extension SelectLanguageView {
    final class ViewModel: ObservableObject {
        
        @Published var languages = ["Russian", "English", "Chinese", "Belarus", "Kazakh"]
        @Published var systemLanguage = Locale.current.language.languageCode?.identifier
        @Published var systemLanguageString: String? = {
            let preferredLanguage = Locale.preferredLanguages.first ?? "en"
            let systemCode = Locale(identifier: preferredLanguage).languageCode ?? "en"
            let englishLocale = Locale(identifier: "en_US")
            return englishLocale.localizedString(forLanguageCode: systemCode)?.capitalized
        }()

        func setNewLanguage(_ languageCode: String) {
            
            UserDefaults.standard.set([languageCode], forKey: "AppleLanguages")
            UserDefaults.standard.synchronize()
            
        }
        
    }
}
