//
//  apiManager.swift
//  Coin-Challenge
//
//  Created by Palatip Jantawong on 11/3/2567 BE.
//

import Foundation

struct ExchangeRatesResponse: Decodable {
    let asset_id_base: String
    let asset_id_quote: String
    let rate: Double
}

final class NetworkManager{
    static let shared = NetworkManager()
    static let baseURL = "https://rest.coinapi.io/v1"
    private let exchangerateURL = baseURL + "/exchangerate"
    
    private let apikey = "A9AD435D-2831-4BDD-87D9-DD014ED31689"
    
    private init() {}
    
    func getExchangeRate(crypto: String, dollar: String) async throws -> ExchangeRatesResponse {
        
        guard let url = URL(string: exchangerateURL+"/\(crypto)/\(dollar)?apikey=\(apikey)") else {
            throw exError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(ExchangeRatesResponse.self, from: data)
        } catch{
            throw exError.invalidData
        }
    }
}

enum exError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}
