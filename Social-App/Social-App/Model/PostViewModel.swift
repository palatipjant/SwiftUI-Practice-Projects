//
//  PostViewModel.swift
//  Social-App
//
//  Created by Palatip Jantawong on 12/3/2567 BE.
//

import Foundation
import UIKit

class PostViewModel: ObservableObject{
    
    @Published var posts = [Post]()
    
    init() {
        fetchAllPosts()
    }
    
    func fetchAllPosts() {
        FirebaseManager.shared.firestore
            .collection("posts")
            .getDocuments { documentSnapshot, error in
                if let error = error {
                    print("failed to fetch posts \(error)")
                    return
                }
                
                documentSnapshot?.documents.forEach({ snapshot in
                    let data = snapshot.data()
                    let post = Post(data: data)
                    
                    self.posts.append(post)
                    self.posts.sort(by: {$0.timestamp > $1.timestamp})
                })
            }
    }
    
    func gwtUserProfileImage(useruid: String, completion: @escaping (UIImage?) -> Void ) {
        let ref = FirebaseManager.shared.storage.reference(withPath: useruid)
        ref.getData(maxSize: 3*1024*1024) { data, error in
            if let error = error {
                print("error getting post image \(error.localizedDescription)")
                completion(nil)
            } else {
                if let data = data {
                    let image = UIImage(data: data)
                    completion(image)
                }
            }
        }
    }
}

