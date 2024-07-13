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
    @State private var price: String = ""
    var body: some View {
        ZStack(alignment: .topLeading) {
            OFColor.background.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                AssetView(symbol: symbol)
                    .padding()
                LineChartView(data: data)
                    .frame(height: 200)
                ExchangeRateView(baseSymbol: symbol)
                    .padding()
                Spacer()
                HStack {
                    OFButton(title: "Buy") {
                        print("buy")
                    }
                    .padding()
                    OFButton(type: .gray, title: "Sell") {
                        print("sell")
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    DetailView(symbol: "AMZN")
}
