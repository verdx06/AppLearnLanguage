//
//  SignupView.swift
//  AppLearnLanguage
//
//  Created by Виталий Багаутдинов on 26.03.2025.
//

import SwiftUI

struct SignupView: View {
    
    @StateObject var vm = ViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            
            CustomTextField(name: "First Name", example: "Your First Name", text: $vm.Firstname)
            CustomTextField(name: "Last Name", example: "Your Last Name", text: $vm.Lastname)
            CustomTextField(name: "Email Address", example: "Email", text: $vm.email)
            
            Spacer()
            Spacer()
        }.padding(.horizontal)
        .header("Signup")
    }
}

#Preview {
    SignupView()
}
