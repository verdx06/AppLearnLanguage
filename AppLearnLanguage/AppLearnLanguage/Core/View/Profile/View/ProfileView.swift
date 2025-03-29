//
//  ProfileView.swift
//  AppLearnLanguage
//
//  Created by Виталий Багаутдинов on 26.03.2025.
//

import SwiftUI

struct ProfileView: View {
    
    let name = UserDefaults.standard.string(forKey: "userName")
    
    var body: some View {
        VStack (alignment: .leading){
            ZStack {
                Rectangle().frame(maxWidth: .infinity)
                    .frame(height: 231)
                    .foregroundStyle(Color.deppBlue)
                HStack {
                    VStack {
                        Image("avatar")
                        if let name = name{
                            Text(name).fredokaFont(size: 22, font: .medium)
                                .foregroundColor(Color.white)
                        } else {
                            ProgressView()
                        }
                    }
                    Button {
                        UserDefaults.standard.set("", forKey: "userName")
                    } label: {
                        Text("reset")
                    }

                    Spacer()
                }.padding()
            .padding(.top, 30)
                
            }
            Spacer()
        }.edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    ProfileView()
}
