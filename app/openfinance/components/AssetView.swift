//
//  AssetView.swift
//  openfinance
//
//  Created by Jann Driessen on 13.07.24.
//

import SwiftUI

struct AssetView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("AMZN")
                .font(.system(size: 32, weight: .black))
            Text("$189.45")
                .font(.system(size: 24, weight: .bold))
        }
    }
}

#Preview {
    AssetView()
}
