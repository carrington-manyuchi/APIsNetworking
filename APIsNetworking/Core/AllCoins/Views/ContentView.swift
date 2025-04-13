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
            Text("\(coinsViewModel.coin): \(coinsViewModel.price)")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
