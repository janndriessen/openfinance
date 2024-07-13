//
//  ContentView.swift
//  openfinance
//
//  Created by Jann Driessen on 12.07.24.
//

import SwiftUI

struct ContentView: View {
    @State private var shouldTransition = false
    var body: some View {
        VStack {
            if shouldTransition {
                Dash()
                    .transition(.opacity)
            } else {
                ZStack {
                    OFColor.background.edgesIgnoringSafeArea(.all)
                    VStack {
                        Text("Open Finance")
                            .font(.system(size: 36))
                            .bold()
                    }
                    .padding()
                }
            }
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 2.5, repeats: false) { _ in
                withAnimation(.easeIn) {
                    shouldTransition = true
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
