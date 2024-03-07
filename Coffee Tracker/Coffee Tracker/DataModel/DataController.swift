//
//  DataController.swift
//  Coffee Tracker
//
//  Created by Palatip Jantawong on 7/3/2567 BE.
//

import Foundation
import CoreData

class DataController: ObservableObject{
    
    let container = NSPersistentContainer(name: "Coffee")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Failed to load data in data controller \(error.localizedDescription)")
            }
        }
    }
}
