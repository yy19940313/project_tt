//
//  TopNavigation.swift
//  project_tt
//
//  Created by Yi Y on 7/24/24.
//

import SwiftUI

struct TopNavigation: View {
    var title: String

    var body: some View {
        VStack {
            HStack {
                Image("logo_name") // Use the current image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 50) // Adjust the size as needed
                    .offset(x: 10)
                
                Spacer()
                
                Text(title)
                    .multilineTextAlignment(.center)
                    .offset(x: -10)
                    .font(Font.custom("MerriweatherSans-Regular", size: 16).weight(.regular))
                
                Spacer()
                
                Button(action: {
                    // Action for the create button
                }) {
                    Image("create_button")
                        .resizable()
                        .frame(width: 28, height: 28)
                        .foregroundColor(Color(red: 0.93, green: 0.04, blue: 0.26)) // Added color ED0942
                }
                .padding(.trailing, 20)
            }
            Divider()
        }
    }
}

#Preview {
    TopNavigation(title: "xxxxx")
}
