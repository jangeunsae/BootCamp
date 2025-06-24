//
//  CalculatorView.swift
//  CalculatorApp
//
//  Created by 장은새 on 6/20/25.
//

import SwiftUI

struct CalculatorView: View {
    @StateObject private var viewModel = CalculatorViewModel()

    let buttons: [[CalculatorButton]] = [
        [.digit("7"), .digit("8"), .digit("9"), .operation("+")],
        [.digit("4"), .digit("5"), .digit("6"), .operation("-")],
        [.digit("1"), .digit("2"), .digit("3"), .operation("*")],
        [.clear, .digit("0"), .equal, .operation("/")]
    ]

    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            Text(viewModel.display)
                .font(.system(size: 64))
                .foregroundColor(.white)
                .lineLimit(1)
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .trailing)

            ForEach(buttons.indices, id: \.self) { rowIndex in
                HStack(spacing: 12) {
                    ForEach(buttons[rowIndex], id: \.self) { button in
                        CalculatorButtonView(button: button) {
                            viewModel.receiveInput(button)
                        }
                        .background(Color.clear)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.ignoresSafeArea())
    }
}
