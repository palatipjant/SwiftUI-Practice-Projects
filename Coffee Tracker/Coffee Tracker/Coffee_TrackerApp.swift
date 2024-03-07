//
//  Coffee_TrackerApp.swift
//  Coffee Tracker
//
//  Created by Palatip Jantawong on 7/3/2567 BE.
//

import SwiftUI

@main
struct Coffee_TrackerApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
