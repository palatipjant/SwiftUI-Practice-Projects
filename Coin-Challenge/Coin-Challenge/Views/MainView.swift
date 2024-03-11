//
//  MainView.swift
//  Coin-Challenge
//
//  Created by Palatip Jantawong on 11/3/2567 BE.
//

import SwiftUI

struct MainView: View {
    
    @State private var exchangeResult = 0.00
    @State private var pickerDollar = "RUB"
    @State private var pickerCrypto = "BTC"
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("What is the exchange rate between dollar and crypto currencies?")
                .font(.title)
            
            Text("$ \(viewModel.exchangeRates.rate, specifier: "%.2f")")
                .font(.system(size: 50))
            
            Text("Dollar Currencies")
                .font(.title)
            
            Picker("Dollar", selection: $pickerDollar) {
                Text("RUB").tag("RUB")
                Text("AFN").tag("EUR")
                Text("ALL").tag("ALL")
                Text("AUD").tag("AUD")
                Text("USD").tag("USD")
                Text("SGD").tag("SGD")
            }
            .pickerStyle(.wheel)
            .onChange(of: pickerDollar) {
                viewModel.getExchangeRate(crypto: pickerCrypto, dollar: pickerDollar)
            }
            
            Text("Crypto Currencies")
                .font(.title)
            
            Picker("Crypto", selection: $pickerCrypto) {
                Text("BTC").tag("BTC")
                Text("AUD").tag("ETH")
                Text("USDT").tag("USDT")
                Text("BNB").tag("BNB")
                Text("SOL").tag("SOL")
                Text("XRP").tag("XRP")
            }
            .pickerStyle(.wheel)
            .onChange(of: pickerCrypto) {
                viewModel.getExchangeRate(crypto: pickerCrypto, dollar: pickerDollar)
            }
                
        }
        .multilineTextAlignment(.center)
        .padding()
        .task {
            viewModel.getExchangeRate(crypto: pickerCrypto, dollar: pickerDollar)
        }
    }
    
}

#Preview {
    MainView()
}
