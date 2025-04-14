//
//  ContentView.swift
//  APIsNetworking
//
//  Created by Manyuchi, Carrington C on 2025/04/12.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var coinsViewModel = CoinsViewModel()
    
    var body: some View {
        VStack {
            List {
                ForEach(coinsViewModel.coins) { coin in
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(coin.name)
                                .fontWeight(.semibold)
                            Text(coin.symbol.uppercased())
                        }
                    }
                    .font(.footnote)
                }
            }
            .overlay {
                if let error = coinsViewModel.errorMessage {
                    Text(error)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
