//
//  OnboardingViewModel.swift
//  AppLearnLanguage
//
//  Created by Виталий Багаутдинов on 25.03.2025.
//

import Foundation

extension OnboardingView {
    class ViewModel: ObservableObject {
        @Published var queue: [QueueModel] = Constants.queue
        @Published var current: QueueModel?
        @Published var button: String = ""
        @Published var lastKey: String?
        
        init(customqueue: [QueueModel]? = nil, lastKey: String? = nil) {
            self.queue = customqueue ?? queue
            self.lastKey = lastKey
            lastScreen()
            next()
        }
        
        func next() {
            
            guard !queue.isEmpty else {
                save(id: "watched")
                return
            }
            
            let index = queue.removeFirst()
            
            switch index.id {
            case "1" :
                button = "Next"
            case "2" :
                button = "More"
            case "3" :
                button = "Choose a language"
                
            default:
                button = ""
            }
            
            current = index
            
            save(id: index.id)
            
        }
        
        func skip() {
            save(id: "watched")
        }
        
        func save(id: String) {
            UserDefaults.standard.set(id, forKey: UserKey.lastWatched.rawValue)
        }
        
        private func lastScreen() {
            if let lastWatch = UserDefaults.standard.string(forKey: lastKey ?? UserKey.lastWatched.rawValue) {
                if let _ = queue.first(where: { $0.id == lastWatch }) {
                    if let index = queue.firstIndex(where: { $0.id == lastWatch }) {
                        self.queue.removeFirst(index)
                    }
                }
            }
        }
        
    }
}
