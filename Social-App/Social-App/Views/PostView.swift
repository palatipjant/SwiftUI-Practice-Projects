//
//  PostView.swift
//  Social-App
//
//  Created by Palatip Jantawong on 11/3/2567 BE.
//

import SwiftUI

struct PostComponeny: View{
    
    let post: Post
    var postViewModel = PostViewModel()
    @State private var profileImage: UIImage?
    @State private var isLoadingImage = false
    
    var body: some View{
        VStack{
            
        }
    }
}

struct PostView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    PostView()
}
