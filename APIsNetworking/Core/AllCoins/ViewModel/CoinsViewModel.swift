//
//  CoinsViewModel.swift
//  APIsNetworking
//
//  Created by Manyuchi, Carrington C on 2025/04/12.
//

import Foundation

class CoinsViewModel: ObservableObject {
    @Published var coin = ""
    @Published var price = ""
    @Published var errorMessage: String?
    
    private let service = CoinDataService()
    
    init() {
        fetchPrice(coin: "bitcoin")
    }
    
    func fetchPrice(coin: String) {
        service.fetchPrice(coin: coin) { price in
            print("****Price from service****: \(price)")
            
            DispatchQueue.main.async {
                self.price = "$\(price)"
                self.coin = coin
            }
        }
    }
    
}
