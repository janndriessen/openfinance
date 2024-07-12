//
//  Colors.swift
//  openfinance
//
//  Created by Jann Driessen on 12.07.24.
//

import Foundation
import SwiftUI

enum OFColor {
    static let black = Color(hex: 0x2B2A2A)
    static let gray = Color(hex: 0xF5F5F5)
}

// MARK: - Extensions

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }

    init(light: Color, dark: Color) {
      self.init(UIColor(light: UIColor(light), dark: UIColor(dark)))
    }
}

extension UIColor {
  convenience init(light: UIColor, dark: UIColor) {
    self.init { traitCollection in
      switch traitCollection.userInterfaceStyle {
      case .light, .unspecified:
        return light
      case .dark:
        return dark
      @unknown default:
        return light
      }
    }
  }
}
