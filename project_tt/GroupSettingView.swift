//
//  GroupSettingView.swift
//  project_tt
//
//  Created by Yi Y on 7/14/24.
//

/*
import SwiftUI

struct GroupMember: Identifiable {
    let id = UUID()
    let name: String
}

struct ProfileSettingsView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var notificationsEnabled: Bool = true
    
    let groupMembers: [GroupMember] = [
        GroupMember(name: "Alice"),
        GroupMember(name: "Bob"),
        GroupMember(name: "Charlie")
    ]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Group Members")) {
                    ForEach(groupMembers) { member in
                        Text(member.name)
                    }
                }
                
                Section(header: Text("Profile Information")) {
                    TextField("Name", text: $name)
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                }
                
                Section(header: Text("Preferences")) {
                    Toggle(isOn: $notificationsEnabled) {
                        Text("Enable Notifications")
                    }
                }
                
                Section {
                    Button(action: saveChanges) {
                        Text("Save Changes")
                    }
                }
            }
            .navigationBarTitle("Profile Settings")
        }
    }
    
    func saveChanges() {
        // Handle save action
        print("Changes saved")
    }
}
 */

