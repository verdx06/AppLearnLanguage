//
//  NetworkModel.swift
//  AppLearnLanguage
//
//  Created by Виталий Багаутдинов on 27.03.2025.
//

import Foundation
import Network
import SwiftUI

class NetworkModel {
    
    @Published var isConnected: Bool = true
    
    
    static let instance = NetworkModel()
    
    let networkMonitor = NWPathMonitor()
    
    let queue = DispatchQueue(label: "NetworkQueue")
    
    init() {
        networkMonitor.pathUpdateHandler = { path in
            let isConnected = path.status == .satisfied
            
            DispatchQueue.main.async {
                self.isConnected = isConnected
            }
        }
        networkMonitor.start(queue: queue)
    }
    
}

