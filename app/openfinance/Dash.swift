//
//  Dash.swift
//  openfinance
//
//  Created by Jann Driessen on 12.07.24.
//

import SwiftUI

struct Dash: View {
    @State private var showDetail = false
    var body: some View {
        ZStack(alignment: .topLeading) {
            OFColor.background.edgesIgnoringSafeArea(.all)
            VStack {
                BalanceView()
                Spacer()
                Button("Detail") {
                    showDetail.toggle()
                }
            }
            .padding()
        }
        .sheet(isPresented: $showDetail, content: {
            DetailView()
        })
    }
}

#Preview {
    Dash()
}
