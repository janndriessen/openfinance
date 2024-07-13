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
    @State private var detailItem: DetailViewItem? = nil
    var body: some View {
        ZStack(alignment: .topLeading) {
            OFColor.background.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                BalanceView()
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
        .sheet(item: $detailItem, content: {
            DetailView(symbol: $0.symbol)
        })
    }
}

#Preview {
    Dash()
}
