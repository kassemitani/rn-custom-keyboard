//
//  CustomKeyboardView.swift
//  keyboard
//
//  Created by Kassem Itani on 11.03.2024.
//

import SwiftUI

struct CustomKeyboardView: View {
    let onKeyPress: (String)  -> Void

    // Initialize with randomized numbers
    let keys: [[String]] = {
        var numbers = Array(0...9).map(String.init).shuffled()
        numbers.append("X") // Delete button
        return stride(from: 0, to: numbers.count, by: 3).map {
            Array(numbers[$0..<min($0 + 3, numbers.count)])
        }
    }()

    var body: some View {
        VStack(spacing: 5) {
            ForEach(keys, id: \.self) { row in
                HStack(spacing: 5) {
                    ForEach(row, id: \.self) { key in
                        Button(action: {
                          self.onKeyPress(key)
                        }) {
                            Text(key)
                                .font(.title)
                                .frame(width: self.buttonWidth, height: 75)
                                .background(Color.gray.opacity(0.2))
                        }
                    }
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    private var buttonWidth: CGFloat {
        return (UIScreen.main.bounds.width - 6 * 5) / 3
    }

}
