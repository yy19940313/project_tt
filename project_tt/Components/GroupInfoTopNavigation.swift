//
//  GroupInfoTopNavigation.swift
//  project_tt
//
//  Created by Yi Y on 7/24/24.
//

import SwiftUI

struct GroupInfoTopNavigation: View {
    var title: String

    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                
                Text(title)
                    .multilineTextAlignment(.center)
                    .offset(x: 10)
                    .font(Font.custom("MerriweatherSans-Regular", size: 16).weight(.regular))
                
                Spacer()
                
                
                Button(action: {
                    // Action for the create button
                }) {
                    Image(systemName: "square.and.arrow.up")
                        .resizable()
                        .frame(width: 20, height: 28)
                        .foregroundColor(.black) // Change icon color to black
                }
                .padding(.trailing, 20)
            }
            Divider()
        }
    }
}


#Preview {
    GroupInfoTopNavigation(title: "Group Name #0")
}
