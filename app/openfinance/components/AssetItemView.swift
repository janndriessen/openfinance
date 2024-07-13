//
//  AssetItemView.swift
//  openfinance
//
//  Created by Jann Driessen on 13.07.24.
//

import SwiftUI

struct AssetItemView: View {
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
    @State private var price: String = ""
    var body: some View {
        HStack {
            AssetView(symbol: symbol, price: price)
                .padding(.trailing, 30)
            LineChartView(data: data)
                .frame(height: 70)
        }
        .padding(.horizontal)
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
}

#Preview {
    AssetItemView(symbol: "AMZN")
}
