//
//  PersonalSettingsView.swift
//  project_tt
//
//  Created by Yi Y on 7/23/24.
//

import SwiftUI

struct PersonalSettingsView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Account")) {
                    NavigationLink(destination: Text("Change Password")) {
                        Text("Change Password")
                    }
                    NavigationLink(destination: Text("Change Username")) {
                        Text("Change Username")
                    }
                    NavigationLink(destination: Text("Privacy Settings")) {
                        Text("Privacy Settings")
                    }
                    NavigationLink(destination: Text("Log Out")) {
                        Text("Log Out")
                    }
                }
                Section(header: Text("Users")) {
                    NavigationLink(destination: Text("Blocked")) {
                        Text("Blocked")
                    }
                }
                Section(header: Text("About")) {
                    NavigationLink(destination: Text("Terms of Service")) {
                        Text("Terms of Service")
                    }
                    NavigationLink(destination: Text("Privacy Policy")) {
                        Text("Privacy Policy")
                    }
                }
                Section(header: Text("Login")) {
                    NavigationLink(destination: Text("Log Off")) {
                        Text("Log Off")
                    }
                }
                
            }
            .listStyle(PlainListStyle())
            .navigationBarTitle(Text("Settings").font(.title), displayMode: .inline)
            .background(Color.white.edgesIgnoringSafeArea(.all)) // Set the background color for the entire view
            .background(Color.white) // Set the background color of the list
        } // end Navigation View
        .font(Font.custom("Rubik", size: 14).weight(.regular))
    }
    
}


struct PersonalSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalSettingsView()
    }
}
