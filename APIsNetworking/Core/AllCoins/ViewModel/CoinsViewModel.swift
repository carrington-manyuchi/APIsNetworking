//
//  CoinsViewModel.swift
//  APIsNetworking
//
//  Created by Manyuchi, Carrington C on 2025/04/12.
//

import Foundation

class CoinsViewModel: ObservableObject {

    @Published var coins = [Coin]()
    @Published var errorMessage: String?
    
    private let service = CoinDataService()

    init() {
        Task { try await  fetchCoins() }
    }
    
    func fetchCoins() async throws {
        let coins = await service.fetchCoins()
        DispatchQueue.main.async {
            self.coins = coins
        }
    }
    
    func fetchCoinsWithCompletionHandler() {
        service.fetchCoinsWithResult { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let coins):
                    self?.coins = coins
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
}
