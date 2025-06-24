//
//  CalculatorButtonView.swift
//  CalculatorApp
//
//  Created by 장은새 on 6/20/25.
//

import SwiftUI

struct CalculatorButtonView: View {
    let button: CalculatorButton
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(button.title)
                .font(.system(size: 28))
                .frame(width: 80, height: 80)
                .foregroundColor(.white)
                .background(button.backgroundColor)
                .clipShape(Circle())
        }
    }
}
