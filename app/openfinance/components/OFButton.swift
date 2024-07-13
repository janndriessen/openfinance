//
//  OFButton.swift
//  openfinance
//
//  Created by Jann Driessen on 13.07.24.
//

import SwiftUI

enum OFButtonType {
    case black
    case gray
}

struct OFButton: View {
    var type: OFButtonType = .black
    var title: String
    var systemName: String?
    var isLoading: Bool = false
    var action: () -> Void

    var body: some View {
        let backgroundColor = type == .gray ? OFColor.gray : OFColor.black
        let disabledBackgroundColor = Color.gray
        let foregroundColor = type == .gray ? OFColor.black : OFColor.white
        return (
            Button(action: {
                action()
            }, label: {
                ZStack {
                    if !isLoading {
                        HStack {
                            if let systemName = self.systemName {
                                Image(systemName: systemName)
                                    .foregroundColor(foregroundColor)
                            }
                            Text(title)
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(foregroundColor)
                        }
                        .opacity(isLoading ? 0 : 1.0)
                        .padding()
                    }
                    if isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .tint(foregroundColor)
                            .padding()
                    }
                }
            })
            .buttonStyle(
                rounded(backgroundColor: backgroundColor,
                        disabledBackgroundColor: disabledBackgroundColor)
            )
        )
    }
}

// MARK: - Private

private struct rounded: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled: Bool
    var backgroundColor: Color
    var disabledBackgroundColor: Color
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 16)
            .background(isEnabled ? backgroundColor : disabledBackgroundColor)
            .cornerRadius(16.0)
            .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 2)
            .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
            .frame(height: 52)
    }
}

#Preview {
    OFButton(title: "Buy") {}
}
