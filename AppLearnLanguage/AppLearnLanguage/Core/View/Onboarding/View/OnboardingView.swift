//
//  ContentView.swift
//  AppLearnLanguage
//
//  Created by Виталий Багаутдинов on 25.03.2025.
//

import SwiftUI

struct OnboardingView: View {
    
    @StateObject var vm = ViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Spacer()
                if let current = vm.current {
                    Image(current.image)
                    Spacer()
                    StepView(step: current.id)
                        .padding(.vertical)
                    Text(current.text)
                        .fredokaFont(size: 22, font: .medium)
                        .padding(.bottom, 5)
                    Text(current.subtext)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color.black.opacity(0.6))
                        .fredokaFont(size: 15)
                        .padding(.bottom, 30)
                    Button {
                        withAnimation(.easeInOut) {
                            vm.next()
                        }
                    } label: {
                        Text(vm.button)
                    }.buttonStyle(MainButtonStyle())
                        .padding(.top)
                        .padding(.bottom, 10)
                    Button {
                        vm.skip()
                    } label: {
                        Text("Skip onboarding")
                            .foregroundStyle(Color.black)
                            .fredokaFont(size: 15)
                    }
                }
                
                NavigationLink(destination: SelectLanguageView(), isActive: $vm.isNavigate) {
                    EmptyView()
                }
                
                
            }.padding()
        }
    }
}

#Preview {
    OnboardingView()
}
