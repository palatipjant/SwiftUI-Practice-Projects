//
//  PostModel.swift
//  Social-App
//
//  Created by Palatip Jantawong on 12/3/2567 BE.
//

import Foundation
import Firebase

struct Post: Decodable, Identifiable{
    var id: String
    var postTitle: String
    var timestamp: Date
    var name: String
    var useruid: String
    var imageURL: String
    
    init(data: [String: Any]) {
        self.id = data["id"] as? String ?? ""
        self.postTitle = data["title"] as? String ?? ""
        self.timestamp = (data["timestamp"] as? Timestamp)?.dateValue() ?? Date()
        self.name = data["name"] as? String ?? ""
        self.useruid = data["useruid"] as? String ?? ""
        self.imageURL = data["imageURL"] as? String ?? ""
    }
}
