//
//  ContentView.swift
//  openfinance
//
//  Created by Jann Driessen on 12.07.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            OFColor.gray.edgesIgnoringSafeArea(.all)
            VStack {
//                Image(systemName: "globe")
//                    .imageScale(.large)
//                    .foregroundStyle(.tint)
                Text("Open Finance")
                    .font(.system(size: 36))
                    .bold()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
