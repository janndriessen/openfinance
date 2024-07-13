//
//  DetailView.swift
//  openfinance
//
//  Created by Jann Driessen on 12.07.24.
//

import SwiftUI

struct DetailView: View {
    let data = [
        DataPoint(x: 0, y: 1),
        DataPoint(x: 1, y: 3),
        DataPoint(x: 2, y: 2),
        DataPoint(x: 3, y: 4),
        DataPoint(x: 4, y: 3)
    ]
    var body: some View {
        ZStack {
            OFColor.background.edgesIgnoringSafeArea(.all)
            VStack {
                Text("AAPL")
                    .font(.title)
                    .foregroundStyle(OFColor.black)
                LineChartView(data: data)
            }
        }
    }
}

#Preview {
    DetailView()
}
