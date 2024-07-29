//
//  EditProfileButton.swift
//  project_tt
//
//  Created by Yi Y on 7/29/24.
//


import SwiftUI

struct EditProfileButton: View {
    var action: () -> Void = {}
    
    var body: some View {
        Button(action: action) {
                Text("Edit Profile")
                    .font(Font.custom("Rubik", size: 18).weight(.medium))
                    .foregroundColor(Color(red: 0, green: 0.15, blue: 0.29))
                    .frame(width: 200, height: 30)
                    .background(Color.green.opacity(0.7))
                    .cornerRadius(32)
        }
    }
}

#Preview {
    EditProfileButton()
}
