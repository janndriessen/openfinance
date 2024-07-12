//
//  DetailView.swift
//  openfinance
//
//  Created by Jann Driessen on 12.07.24.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        ZStack {
            OFColor.background.edgesIgnoringSafeArea(.all)
            Text("AAPL")
                .font(.title)
                .foregroundStyle(OFColor.black)
        }
    }
}

#Preview {
    DetailView()
}
