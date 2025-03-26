//
//  SelectLanguageView.swift
//  AppLearnLanguage
//
//  Created by Виталий Багаутдинов on 25.03.2025.
//

import SwiftUI

struct SelectLanguageView: View {
    
    @StateObject var vm = ViewModel()
    @State var isSelected: String = ""
    @State var isAlert: Bool = false
    @State private var systemLanguage: String? = {
        let preferredLanguage = Locale.preferredLanguages.first ?? "en"
        let systemCode = Locale(identifier: preferredLanguage).languageCode ?? "en"
        let englishLocale = Locale(identifier: "en_US")
        return englishLocale.localizedString(forLanguageCode: systemCode)?.capitalized
    }()
    
    
    var body: some View {
        ZStack {
            VStack {
                Text("What is your Mother language?")
                    .fredokaFont(size: 22, font: .medium)
                ForEach(vm.languages, id: \.self) { language in
                    Button {
                        if language == "English" || language == systemLanguage {
                            isSelected = language
                        }
                    } label: {
                        Language(text: language, isSelected: isSelected == language)
                    }
                }
                
                Spacer()
                
                Button {
                    if isSelected == systemLanguage {
                        if let system = vm.systemLanguage {
                            vm.setNewLanguage(system)
                        }
                    } else if isSelected == "English" {
                        vm.setNewLanguage("en")
                        isAlert = true
                    }
                } label: {
                    Text("Choose")
                }.buttonStyle(MainButtonStyle())

                
            }
        }
        .alert("Перезапустите приложение", isPresented: $isAlert) {
            Button("OK", role: .cancel) {}
        }
        .header("Language select")
    }
}

#Preview {
    SelectLanguageView()
}
