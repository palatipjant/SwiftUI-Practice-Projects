//
//  ContentView.swift
//  Social-App
//
//  Created by Palatip Jantawong on 11/3/2567 BE.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var loginViewModel = LoginViewModel()
    
    var body: some View {
        if loginViewModel.isCurrentlyLoggedOut {
            LoginView(loginViewModel: loginViewModel)
        } else {
            TabView {
                PostView()
                    .tabItem { Label("Posts",
                                     systemImage: "rectangle.portrait.on.rectangle.portrait.angled") }
                
                ProfileView(loginViewModel: loginViewModel)
                    .tabItem { Label("Profile", systemImage: "gear") }
            }
        }
    }
}

#Preview {
    MainView()
}
