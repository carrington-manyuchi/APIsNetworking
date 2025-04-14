//
//  Coin.swift
//  APIsNetworking
//
//  Created by Manyuchi, Carrington C on 2025/04/14.
//

import Foundation

struct Coin: Codable, Identifiable {
    let id: String
    let symbol: String
    let name: String
    let currentPrice: Double?
    let marketCap: Int
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name
        case currentPrice = "current_price"
        case marketCap = "market_cap"
    }
}


