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
    @State private var systemLanguage: String? = {
        let preferredLanguage = Locale.preferredLanguages.first ?? "en"
        let systemCode = Locale(identifier: preferredLanguage).languageCode ?? "en"
        return Locale.current.localizedString(forLanguageCode: systemCode)
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
            }
        }.header("Language select")
    }
}

#Preview {
    SelectLanguageView()
}
