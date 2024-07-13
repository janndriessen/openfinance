//
//  ExchangeRateView.swift
//  openfinance
//
//  Created by Jann Driessen on 13.07.24.
//

import SwiftUI

struct ExchangeRateView: View {
    var body: some View {
        HStack {
            Image(systemName: "rectangle.2.swap")
                .imageScale(.medium)
                .foregroundStyle(OFColor.text)
            Text("1 sAMZN = 189.45 USDC")
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(OFColor.text)
        }
    }
}

#Preview {
    ExchangeRateView()
}
