//
//  BalanceView.swift
//  openfinance
//
//  Created by Jann Driessen on 13.07.24.
//

import SwiftUI

struct BalanceView: View {
    var balance: String
    var body: some View {
        VStack(alignment: .leading) {
            Text("Balance")
                .font(.system(size: 16))
            Text(balance)
                .font(.system(size: 24))
                .bold()
        }
    }
}

#Preview {
    BalanceView(balance: "2.850,75 USDC")
}
