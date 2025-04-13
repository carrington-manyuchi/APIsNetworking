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
    
    init() {
        fetchPrice()
    }
    
    func fetchPrice() {
        
        let urlString = "https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd"
        
        guard let url = URL(string: urlString) else { return }
        
        print("Fetching price....")
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data else { return  }
            
            guard let jsonObject =  try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return }
            guard let value = jsonObject["bitcoin"] as? [String: Any] else { return }
            guard let price = value["USD"] else { return }
            
            print(value)
            
            DispatchQueue.main.async {
                self.coin = "Bitcoin"
                self.price = "$\(price)"
            }
            
            print("**Fetching price**")
        }
        dataTask.resume()
    }
    
}
