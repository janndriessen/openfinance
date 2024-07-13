//
//  AssetView.swift
//  openfinance
//
//  Created by Jann Driessen on 13.07.24.
//

import SwiftUI

struct AssetView: View {
    var symbol: String
    var body: some View {
        VStack(alignment: .leading) {
            Text(symbol)
                .font(.system(size: 32, weight: .black))
            Text("$189.45")
                .font(.system(size: 24, weight: .bold))
        }
    }
}

#Preview {
    AssetView(symbol: "AMZN")
}
