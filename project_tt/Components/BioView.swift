//
//  BioView.swift
//  project_tt
//
//  Created by Yi Y on 7/24/24.
//

import SwiftUI

struct BioView: View {
    let bioText: String

    var body: some View {
        VStack {
            Text(bioText)
                .font(Font.custom("Rubik", size: 16))
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .padding(.top, 20)
                .padding(.bottom, 20)
        }
        .padding(.horizontal)
        .background(Color.white)
        .cornerRadius(16)
        .padding(.top, 5)
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
        .padding(.horizontal, 16)
    }
}

#Preview {
    BioView(bioText: "xxxxx")
}
