//
//  LoginView.swift
//  Social-App
//
//  Created by Palatip Jantawong on 11/3/2567 BE.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var loginViewModel: LoginViewModel
    
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
                    Text(isLoginMode ? "Login" : "Create Account")
                        .font(.largeTitle)
                        .bold()
                    
                    // Image Picker is LoginMode is false
                    if !isLoginMode {
                        Button(action: {
                            shouldShowImagePicker.toggle()
                        }, label: {
                            VStack{
                                if let image = image {
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 128, height: 128)
                                        .clipShape(RoundedRectangle(cornerRadius: 64))
                                } else {
                                    Image(systemName: "person.fill")
                                        .font(.system(size: 64))
                                        .padding()
                                        .foregroundStyle(.black)
                                }
                            }.overlay {
                                RoundedRectangle(cornerRadius: 64)
                                    .stroke(.black, lineWidth: 3)
                            }
                        })
                    }
                    
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .bold()
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(.black.opacity(0.05))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    SecureField("Password", text: $password)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                        .bold()
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(.black.opacity(0.05))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    Button(action: {
                        handleAction()
                    }, label: {
                        Text(isLoginMode ? "Login" : "Create account")
                            .foregroundStyle(.white)
                            .padding(10)
                            .frame(width: 300, height: 50)
                            .background(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.top, 20)
                    })
                    
                    HStack{
                        Text(isLoginMode ? "Don't have an account yet." : "Have an account?")
                        
                        Button(action: {
                            isLoginMode.toggle()
                        }, label: {
                            Text(isLoginMode ? "Create account" : "Login")
                        })
                    }
                    
                    Text(loginStateMessage)
                        .foregroundStyle(.red)
                    
                    
                }).padding()
            }
            .fullScreenCover(isPresented: $shouldShowImagePicker, content: {
                ImagePicker(image: $image)
                    .ignoresSafeArea()
            })
        }
    }
    private func handleAction() {
        if isLoginMode {
            loginViewModel.LoginUser(email: email, password: password)
        } else {
            if let image = image {
                loginViewModel.createNewAccount(email: email, password: password, image: image)
            } else {
                self.loginStateMessage = "Choose Image first!"
            }
        }
    }
}

#Preview {
    LoginView(loginViewModel: LoginViewModel())
}
