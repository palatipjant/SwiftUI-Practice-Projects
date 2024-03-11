//
//  MainView.swift
//  Coin-Challenge
//
//  Created by Palatip Jantawong on 11/3/2567 BE.
//

import SwiftUI

struct MainView: View {
    
    @State private var exchangeResult = 0.00
    @State private var pickerDollar = ""
    @State private var pickerCrypto = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("What is the exchange rate between dollar and crypto currencies?")
                .font(.title)
            
            Text("$ \(exchangeResult, specifier: "%.2f")")
                .font(.system(size: 50))
            
            Text("Dollar Currencies")
                .font(.title)
            
            Picker("Dollar", selection: $pickerDollar) {
                Text("Dollar").tag("Dollar")
                Text("AUD").tag("AUD")
                Text("Dollar").tag("1")
                Text("AUD").tag("2")
                Text("Dollar").tag("3")
                Text("AUD").tag("4")
            }.pickerStyle(.wheel)
            
            Text("Crypto Currencies")
                .font(.title)
            
            Picker("Crypto", selection: $pickerCrypto) {
                Text("Dollar").tag("Dollar")
                Text("AUD").tag("AUD")
                Text("Dollar").tag("1")
                Text("AUD").tag("2")
                Text("Dollar").tag("3")
                Text("AUD").tag("4")
            }.pickerStyle(.wheel)
                
        }
        .multilineTextAlignment(.center)
        .padding()
    }
}

#Preview {
    MainView()
}
