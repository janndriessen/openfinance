//
//  Dash.swift
//  openfinance
//
//  Created by Jann Driessen on 12.07.24.
//

import SwiftUI

struct DetailViewItem: Identifiable {
    let id = UUID()
    let symbol: String
}

struct Dash: View {
    @State private var balance = ""
    @State private var detailItem: DetailViewItem? = nil
    var body: some View {
        ZStack(alignment: .topLeading) {
            OFColor.background.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                BalanceView(balance: balance)
                    .padding()
                ForEach(OFSymbols.allCases, id: \.self) { symbol in
                    AssetItemView(symbol: symbol.rawValue)
                        .onTapGesture {
                            detailItem = DetailViewItem(symbol: symbol.rawValue)
                        }
                }
                Spacer()
            }
        }
        .onAppear {
            Task.init {
                let api = OFApi()
                let fetchedBalance = try? await api.getBalance(for: "USDC", account: "0x77DA8EdFcdcA35E4c28f64A21e4808A24741eF20")
                if let fetchedBalance {
                    self.balance = fetchedBalance
                }
            }
        }
        .sheet(item: $detailItem, content: {
            DetailView(symbol: $0.symbol)
        })
    }
}

#Preview {
    Dash()
}
