//
//  LoadingView.swift
//  OpenWeather
//
//  Created by Palatip Jantawong on 9/3/2567 BE.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack{
            Text("Please wait a moment 😃")
                .padding(5)
            ProgressView()
                .progressViewStyle(.circular)
        }
    }
}

#Preview {
    LoadingView()
}
