//
//  ProfileView.swift
//  Social-App
//
//  Created by Palatip Jantawong on 11/3/2567 BE.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var loginViewModel: LoginViewModel
    @State private var showLogOutOptions = false
    @State private var showAddPostView = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            VStack{
                
            }
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        showLogOutOptions.toggle()
                    
                    }, label: {
                        Image(systemName: "gear")
                            .font(.system(size: 24))
                            .bold()
                            .foregroundStyle(.black)
                    })
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button{
                        showAddPostView.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .font(.system(size: 24))
                            .foregroundStyle(.blue)
                    }
                }
            })
            .confirmationDialog("Settings", isPresented: $showLogOutOptions) {
                Button("Sign Out") {
                    loginViewModel.handleSignOut()
                }
            } message: {
                Text("What do you want to do?")
            }
            .sheet(isPresented: $showAddPostView, content: {
                AddPostView()
            })
        }
    }
}

#Preview {
    ProfileView(loginViewModel: LoginViewModel())
}
