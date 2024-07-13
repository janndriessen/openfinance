//
//  ExchangeRateView.swift
//  openfinance
//
//  Created by Jann Driessen on 13.07.24.
//

import SwiftUI

struct ExchangeRateView: View {
    var baseSymbol: String
    var quoteSymbol: String = "USDC"
    var body: some View {
        HStack {
            Image(systemName: "rectangle.2.swap")
                .imageScale(.medium)
                .foregroundStyle(OFColor.text)
            Text("1 \(baseSymbol) = 189.45 \(quoteSymbol)")
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(OFColor.text)
        }
    }
}

#Preview {
    ExchangeRateView(baseSymbol: "AMZN")
}
