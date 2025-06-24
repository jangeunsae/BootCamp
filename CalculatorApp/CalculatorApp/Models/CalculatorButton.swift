//
//  CalculatorButton.swift
//  CalculatorApp
//
//  Created by 장은새 on 6/20/25.
//

import SwiftUI

enum CalculatorButton: Hashable {
    case digit(String)
    case operation(String)
    case equal
    case clear

    var title: String {
        switch self {
        case .digit(let value): return value
        case .operation(let op): return op
        case .equal: return "="
        case .clear: return "AC"
        }
    }

    var backgroundColor: Color {
        switch self {
        case .digit: return .darkGray
        case .operation: return .orange
        case .equal: return .orange
        case .clear: return .orange
        }
    }
}
