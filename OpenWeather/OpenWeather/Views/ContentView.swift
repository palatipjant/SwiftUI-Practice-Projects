//
//  ContentView.swift
//  OpenWeather
//
//  Created by Palatip Jantawong on 9/3/2567 BE.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        VStack{
            
            if let location = locationManager.location {
                Text("Current coordinates, \(location.longitude), \(location.latitude)")
            } else {
                if locationManager.isLoading {
                    // loading view
                } else {
                    WelcomeView(locationManager: locationManager)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
