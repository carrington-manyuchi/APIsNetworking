//
//  CoinDataService.swift
//  APIsNetworking
//
//  Created by Manyuchi, Carrington C on 2025/04/13.
//

import Foundation

class CoinDataService {
    
    func fetchPrice(coin: String, completion: @escaping(Double) -> Void) {
        let urlString = "https://api.coingecko.com/api/v3/simple/price?ids=\(coin)&vs_currencies=usd"
        guard let url = URL(string: urlString) else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let httpResponse = response as? HTTPURLResponse else { return }
            guard httpResponse.statusCode == 200 else { return }
            
            guard let data = data else { return  }
            guard let jsonObject =  try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return }
            guard let value = jsonObject[coin] as? [String: Double] else { return }
            guard let price = value["usd"] else {  return }

            completion(price)
            
        }
        dataTask.resume()
    }
}
