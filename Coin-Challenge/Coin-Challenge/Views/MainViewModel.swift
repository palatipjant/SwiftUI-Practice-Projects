//
//  MainViewModel.swift
//  Coin-Challenge
//
//  Created by Palatip Jantawong on 11/3/2567 BE.
//

import Foundation

@MainActor final class MainViewModel: ObservableObject {
    @Published var exchangeRates = ExchangeRatesResponse(asset_id_base: "Error", asset_id_quote: "Error", rate: 0.00)
    
    func getExchangeRate(crypto: String, dollar: String) {
        Task{
            do{
                exchangeRates = try await NetworkManager.shared.getExchangeRate(crypto: crypto, dollar: dollar)
            } catch{
                print("error")
            }
        }
    }
}
