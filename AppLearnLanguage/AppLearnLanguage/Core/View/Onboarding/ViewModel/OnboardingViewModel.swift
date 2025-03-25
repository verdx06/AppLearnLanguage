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
            if let lastWatch = UserDefaults.standard.string(forKey: lastKey ?? UserKey.lastWatched.rawValue) {
                if let _ = queue.first(where: { $0.id == lastWatch }) {
                    if let index = queue.firstIndex(where: { $0.id == lastWatch }) {
                        self.queue.removeFirst(index)
                    }
                }
            }
            next()
        }
        
        func next() {
            
            if !queue.isEmpty  {
                save(id: "watched")
                return
            } else {
                let index = queue.removeFirst()
                if index.id == "1" {
                    button = "Next"
                }
                current = index
                
                save(id: index.id)
            }
            
        }
        
        func skip() {
            save(id: "watched")
        }
        
        func save(id: String) {
            UserDefaults.standard.set(id, forKey: UserKey.lastWatched.rawValue)
        }
        
    }
}
