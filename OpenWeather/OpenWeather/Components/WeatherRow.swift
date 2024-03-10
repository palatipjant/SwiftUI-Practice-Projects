//
//  WeatherRow.swift
//  OpenWeather
//
//  Created by Palatip Jantawong on 10/3/2567 BE.
//

import SwiftUI

struct WeatherRow: View {
    
    var logo: String
    var name: String
    var value: String
    
    var body: some View {
        HStack(spacing: 20, content: {
            Image(systemName: logo)
                .font(.title)
                .frame(width: 30, height: 30)
                .padding()
            VStack(alignment: .leading, spacing: 8, content: {
                Text(name)
                    .font(.title2)
                Text(value)
                    .bold()
                    .font(.title2)
            })
        })
    }
}

#Preview {
    WeatherRow(logo: "thermometer", name: "Feels like", value: "8°")
}
