//
//  CalculatorViewModel.swift
//  CalculatorApp
//
//  Created by 장은새 on 6/20/25.
//

import Foundation

class CalculatorViewModel: ObservableObject {
    @Published var display: String = "0"

    private var currentInput: String = ""

    func receiveInput(_ input: CalculatorButton) {
        switch input {
        case .digit(let value):
            if value == "0" && currentInput == "0" {
                return
            } else if currentInput == "0" {
                currentInput = value
            } else {
                currentInput += value
            }
            display = currentInput

        case .operation(let op):
            guard !currentInput.isEmpty else { return }

            if let last = currentInput.last, "+-*/".contains(last) {
                currentInput.removeLast()
            }
            currentInput += op
            display = currentInput

        case .equal:
            let formattedExpression = currentInput.replacingOccurrences(of: "×", with: "*")
                                                   .replacingOccurrences(of: "÷", with: "/")
            let expression = NSExpression(format: formattedExpression)
            if let result = expression.expressionValue(with: nil, context: nil) as? NSNumber {
                display = result.stringValue
                currentInput = result.stringValue
            } else {
                display = "Error"
                currentInput = ""
            }

        case .clear:
            currentInput = ""
            display = "0"
        }
    }
}
