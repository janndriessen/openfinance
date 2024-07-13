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
    @State private var isToggled = false
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
                HStack {
                    Text("USDC")
                        .font(.headline)
                        .foregroundColor(isToggled ? .gray : .blue)
                    Toggle(isOn: $isToggled) {
                        // Empty label, as we are managing the labels separately
                    }
                    .toggleStyle(SwitchToggleStyle(tint: .blue))
                    .labelsHidden()
                    Text("EURC")
                        .font(.headline)
                        .foregroundColor(isToggled ? .blue : .gray)
                }
                .padding()
            }
        }
        .onAppear {
            fetchBalance(symbol: "USDC")
        }
        .onChange(of: isToggled, { _, newValue in
            let quoteAsset = isToggled ? "EURC" : "USDC"
            fetchBalance(symbol: quoteAsset)
        })
        .sheet(item: $detailItem, content: {
            DetailView(symbol: $0.symbol)
        })
    }
    
    @MainActor
    private func fetchBalance(symbol: String) {
        Task.init {
            let api = OFApi()
            let fetchedBalance = try? await api.getBalance(for: symbol, account: "0x77DA8EdFcdcA35E4c28f64A21e4808A24741eF20")
            if let fetchedBalance {
                self.balance = fetchedBalance
            }
        }
    }
}

#Preview {
    Dash()
}
