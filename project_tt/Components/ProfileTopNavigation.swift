//
//  ProfileTopNavigation.swift
//  project_tt
//
//  Created by Yi Y on 7/29/24.
//

import SwiftUI


struct ProfileTopNavigation: View {
    @State private var showingSettings = false

    var body: some View {
        HStack {
            Spacer()
            
            Button(action: {
                showingSettings.toggle()
            }) {
                Image(systemName: "list.bullet")
                    .font(.system(size: 22)) // Set a smaller size, for example, 15
                    .foregroundColor(Color(red: 0.93, green: 0.04, blue: 0.26)) // Added color ED0942
            }
            .padding(.trailing, 20)
            .padding(.bottom, 10)
            .sheet(isPresented: $showingSettings) {
                PersonalSettingsView()
                    .presentationDetents([.fraction(2/3)]) // Set the height of the modal to 2/3 of the screen
            }
        }
    }
}

#Preview {
    ProfileTopNavigation()
}





