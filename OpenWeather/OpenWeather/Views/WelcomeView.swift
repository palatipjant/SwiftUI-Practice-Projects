//
//  WelcomeView.swift
//  OpenWeather
//
//  Created by Palatip Jantawong on 9/3/2567 BE.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    
    @ObservedObject var locationManager: LocationManager
    @State private var isAnimating = false
    
    var body: some View {
        ZStack{
            VStack{
                VStack(spacing: 20, content: {
                    Text("Welcome to OpenWeather App")
                        .bold()
                        .font(.title)
                    Text("Share your present location to retrieve the weather information for your area.")
                        .padding()
                        
                })
                .multilineTextAlignment(.center)
                .padding()
                
                LocationButton(.shareCurrentLocation) {
                    locationManager.requestLocation()
                }
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .symbolVariant(.fill)
                .foregroundStyle(.white)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    WelcomeView(locationManager: LocationManager())
}
