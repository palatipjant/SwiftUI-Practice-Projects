//
//  LoginView.swift
//  Social-App
//
//  Created by Palatip Jantawong on 11/3/2567 BE.
//

import SwiftUI

struct LoginView: View {
    
    @State private var isLoginMode = false
    @State private var email = ""
    @State private var password = ""
    @State private var image: UIImage?
    @State private var loginStateMessage = ""
    @State private var shouldShowImagePicker = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.blue
                    .ignoresSafeArea()
                Circle()
                    .scale(1.8)
                    .foregroundStyle(.white)
                    .opacity(0.15)
                Circle()
                    .scale(1.4)
                    .foregroundStyle(.white)
                VStack(spacing: 16, content: {
                    Text(isLoginMode ? "Login" : "Create Username")
                        .font(.largeTitle)
                        .bold()
                    
                    // Image Picker is LoginMode is false
                    
                    TextField("Email", text: $email)
                    
                }).padding()
            }
        }
    }
}

#Preview {
    LoginView()
}
