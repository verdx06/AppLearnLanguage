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
    
    var body: some View {
        ZStack {
            VStack {
                Text("What is your Mother language?")
                    .fredokaFont(size: 22, font: .medium)
                ForEach(vm.languages, id: \.self) { language in
                    Button {
                        if language == "English" || language == vm.systemLanguageString {
                            isSelected = language
                        }
                    } label: {
                        Language(text: language, isSelected: isSelected == language)
                    }
                }
                
                Spacer()
                
                Button {
                    if isSelected == vm.systemLanguageString {
                        if let system = vm.systemLanguage {
                            vm.setNewLanguage(system)
                            vm.isNavigate = true
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
        .fullScreenCover(isPresented: $vm.isNavigate, content: {
            SignupView()
        })
        .alert("Перезапустите приложение", isPresented: $isAlert) {
            Button("OK", role: .cancel) {vm.isNavigate = true}
        }
        .header("Language select")
    }
}

#Preview {
    SelectLanguageView()
}
