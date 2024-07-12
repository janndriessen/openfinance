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
        ZStack {
            OFColor.background.edgesIgnoringSafeArea(.all)
            VStack {
                Text("Balance")
                Button("Detail") {
                    showDetail.toggle()
                }
            }
        }
        .sheet(isPresented: $showDetail, content: {
            DetailView()
        })
    }
}

#Preview {
    Dash()
}
