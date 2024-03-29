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
            
            BlobShape()
                .frame(width: 400, height: 425)
                .foregroundStyle(LinearGradient(colors: [.pink, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 4), value: isAnimating)
                .brightness(0.3)
                
            
            VStack{
                VStack(spacing: 20, content: {
                    Text("Welcome to OpenWeather App")
                        .bold()
                        .font(.title)
                        .foregroundStyle(.white)
                    Text("Share your present location to retrieve the weather information for your area.")
                        .bold()
                        .padding()
                        .foregroundStyle(.white)
                        
                })
                .multilineTextAlignment(.center)
                .padding()
                
                LocationButton(.shareCurrentLocation) {
                    locationManager.requestLocation()
                }
                .tint(.accent)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .symbolVariant(.fill)
                .foregroundStyle(.white)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onAppear(perform: {
            isAnimating = true
        })
    }
}

#Preview {
    WelcomeView(locationManager: LocationManager())
}
