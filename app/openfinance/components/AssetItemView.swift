//
//  AssetItemView.swift
//  openfinance
//
//  Created by Jann Driessen on 13.07.24.
//

import SwiftUI

struct AssetItemView: View {
    let data = [
        DataPoint(x: 0, y: 1),
        DataPoint(x: 1, y: 3),
        DataPoint(x: 2, y: 2),
        DataPoint(x: 3, y: 4),
        DataPoint(x: 4, y: 3)
    ]
    var body: some View {
        HStack {
            AssetView()
                .padding(.trailing)
            LineChartView(data: data)
                .frame(height: 70)
        }
        .padding(.horizontal)
    }
}

#Preview {
    AssetItemView()
}
