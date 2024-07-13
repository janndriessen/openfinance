//
//  DetailView.swift
//  openfinance
//
//  Created by Jann Driessen on 12.07.24.
//

import SwiftUI

struct DetailView: View {
    var symbol: String
    let data = [
        DataPoint(x: 0, y: 1),
        DataPoint(x: 1, y: 3),
        DataPoint(x: 2, y: 2),
        DataPoint(x: 3, y: 4),
        DataPoint(x: 4, y: 3),
        DataPoint(x: 4, y: 3),
        DataPoint(x: 5, y: 6)
    ]
    @State private var isLoading = false
    @State private var price: String = ""
    var body: some View {
        ZStack(alignment: .topLeading) {
            OFColor.background.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                AssetView(symbol: symbol, price: price)
                    .padding()
                LineChartView(data: data)
                    .frame(height: 200)
                ExchangeRateView(baseSymbol: symbol, quotePrice: price)
                    .padding()
                Spacer()
                HStack {
                    OFButton(title: "Buy", isLoading: isLoading) {
                        buy()
                    }
                    .padding()
                    OFButton(type: .gray, title: "Sell") {
                        print("sell")
                    }
                }
                .padding(.horizontal)
            }
        }
        .onAppear {
            Task.init {
                let api = OFApi()
                let fetchedPrice = try? await api.getPrice(symbol1: "s\(symbol)", symbol2: "USDC")
                if let fetchedPrice {
                    self.price = fetchedPrice
                }
            }
        }
    }
    
    @MainActor
    private func buy() {
        print("buy")
        Task.init {
            isLoading = true
            try await Task.sleep(nanoseconds: 1_500_000_000)
            isLoading = false
        }
        // TODO: could be used if price feeds were working for stocks on the weekend
//                        Task.init {
//                            let api = OFApi()
//                            let _ = try? await api.swap(request: OFApi.SwapRequest(baseToken: symbol, quoteToken: "USDC", amount: "1000000000000000000", isBuy: true))
//                        }
    }
}

#Preview {
    DetailView(symbol: "AMZN")
}
