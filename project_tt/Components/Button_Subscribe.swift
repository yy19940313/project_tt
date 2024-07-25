//
//  Button_Subscribe.swift
//  project_tt
//
//  Created by Yi Y on 7/24/24.
//

import SwiftUI

struct Button_Subscribe: View {
    var price: Double
    var action: () -> Void = {}
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                Text("Subscribe at $\(price, specifier: "%.0f")/month")
                    .font(Font.custom("Rubik", size: 16).weight(.bold))
                    .lineSpacing(27)
                    .foregroundColor(.white)
            }
            .frame(width: 300, height: 40)
            .background(Color(red: 0.93, green: 0.04, blue: 0.26))
            .cornerRadius(32)
        }
    }
}

#Preview {
    Button_Subscribe(price: 7)
}
