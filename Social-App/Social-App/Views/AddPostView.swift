//
//  AddPostView.swift
//  Social-App
//
//  Created by Palatip Jantawong on 12/3/2567 BE.
//

import SwiftUI

struct AddPostView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var postTitle = ""
    @State private var selectedImage: UIImage?
    @State private var isShowingImagePicker = false
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    AddPostView()
}
