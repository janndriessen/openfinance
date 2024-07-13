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
            VStack(alignment: .leading) {
                BalanceView()
                    .padding()
                AssetItemView()
                    .onTapGesture {
                        showDetail.toggle()
                    }
                AssetItemView()
                    .onTapGesture {
                        showDetail.toggle()
                    }
                Spacer()
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
