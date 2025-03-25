//
//  StepView.swift
//  AppLearnLanguage
//
//  Created by Виталий Багаутдинов on 25.03.2025.
//

import SwiftUI

struct StepView: View {
    
    let step: String
    
    var body: some View {
        HStack {
            Image(step == "1" ? "stepActive" : "step")
            Image(step == "2" ? "stepActive" : "step")
            Image(step == "3" ? "stepActive" : "step")
        }
    }
}

#Preview {
    StepView(step: "3")
}
