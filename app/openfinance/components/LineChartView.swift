//
//  LineChartView.swift
//  openfinance
//
//  Created by Jann Driessen on 13.07.24.
//

import Charts
import SwiftUI

struct DataPoint: Identifiable {
    let id = UUID()
    let x: Double
    let y: Double
}

struct LineChartView: View {
    var data: [DataPoint]

    var body: some View {
        Chart(data) { point in
            LineMark(
                x: .value("X Value", point.x),
                y: .value("Y Value", point.y)
            )
            .foregroundStyle(OFColor.black)
        }
        .chartXAxis(.hidden)
        .chartYAxis(.hidden)
        .chartPlotStyle { plotArea in
            plotArea.background(.clear)
        }
    }
}

#Preview {
    let data = [
        DataPoint(x: 0, y: 1),
        DataPoint(x: 1, y: 3),
        DataPoint(x: 2, y: 2),
        DataPoint(x: 3, y: 4),
        DataPoint(x: 4, y: 3),
        DataPoint(x: 4, y: 3),
        DataPoint(x: 5, y: 6)
    ]
    return LineChartView(data: data)
}
