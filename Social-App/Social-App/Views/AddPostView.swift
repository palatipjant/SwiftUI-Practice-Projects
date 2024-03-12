//
//  AddPostView.swift
//  Social-App
//
//  Created by Palatip Jantawong on 12/3/2567 BE.
//

import SwiftUI
import FirebaseAuth

struct AddPostView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var postTitle = ""
    @State private var selectedImage: UIImage?
    @State private var isShowingImagePicker = false
    @State private var errorMessage = ""
    
    var addPostViewModel = AddPostViewModel()
    
    var body: some View {
        VStack{
            HStack(spacing: 15, content: {
                Image(systemName: "person.crop.circle.fill")
                    .font(.system(size: 40))
                    .foregroundStyle(.blue)
                TextField("Share your though", text: $postTitle)
                    .padding(10)
                    .frame(maxWidth: .infinity)
            })
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            
            Button(action: {
                isShowingImagePicker.toggle()
            }, label: {
                VStack{
                    if let image = selectedImage {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.gray, lineWidth: 1)
                            }
                    } else {
                        Image(systemName: "photo.on.rectangle.angled")
                            .font(.system(size: 50))
                            .frame(width: 300, height: 300)
                            .foregroundStyle(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.gray, lineWidth: 1)
                            }
                    }
                }
            }).padding()
            
            Text(errorMessage)
                .bold()
                .foregroundStyle(.red)
            
            Button(action: {
                if selectedImage == nil {
                    errorMessage = "You must select an image first."
                    return
                }
                
                guard let email = Auth.auth().currentUser?.email else {
                    print("Current User not authenticated")
                    return
                }
                
                let name = email.components(separatedBy: "@").first ?? ""
                
                addPostViewModel.AddPost(name: name, postTitle: postTitle, image: selectedImage, date: Date())
                
                dismiss()
            }, label: {
                Text("Share")
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal, 20)
            })
            Spacer()
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal, 20)
        .padding(.vertical, 25)
        .sheet(isPresented: $isShowingImagePicker, content: {
            ImagePicker(image: $selectedImage)
        })
    }
}

#Preview {
    AddPostView()
}
