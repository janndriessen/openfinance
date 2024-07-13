//
//  Config.swift
//  openfinance
//
//  Created by Jann Driessen on 13.07.24.
//

import Foundation

enum OFSymbols: String, Identifiable, CaseIterable {
    case AMZN = "AMZN"
    case AAPL = "AAPL"
    case NKE = "NKE"
    var id: Self { self }
}
