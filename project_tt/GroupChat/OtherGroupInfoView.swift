//
//  OtherGroupInfoView.swift
//  project_tt
//
//  Created by Yi Y on 7/24/24.
//

import SwiftUI

struct GroupMember: Identifiable {
    let id = UUID()
    let name: String
    let imageUrl: String
}

private let groupMembers: [GroupMember] = [
    GroupMember(name: "Vivian", imageUrl: "https://via.placeholder.com/80x80"),
    GroupMember(name: "Anran", imageUrl: "https://via.placeholder.com/80x80"),
    GroupMember(name: "Fiona", imageUrl: "https://via.placeholder.com/80x80")
]

struct OtherGroupInfoView: View {

    
    var body: some View {
        
        
        VStack {
            // Top Navigator
            GroupInfoTopNavigation(title: "Group Name #0")
            
            
            // Group Creators
            Group {
                // Group for profile images and names
                HStack(alignment: .top, spacing: 12) {
                    ForEach(groupMembers) { member in
                        VStack {
                            ProfileImageView(url: member.imageUrl)
                            Text(member.name)
                                .font(Font.custom("Rubik", size: 14))
                                .lineSpacing(21)
                                .foregroundColor(.black)
                        }
                    }
                    // Placeholder for additional member
                    VStack {
                        ProfileImagePlaceholder()
                        Text("Add")
                            .font(Font.custom("Rubik", size: 14))
                            .lineSpacing(21)
                            .foregroundColor(.black)
                    }
                }
                .frame(width: 382)
                
                // Link to see all chat members
                Text("See All Chat Members")
                    .font(Font.custom("Rubik", size: 16).weight(.light))
                    .lineSpacing(24)
                    .underline()
                    .foregroundColor(Color(red: 0, green: 0.15, blue: 0.29))
            }
            
            // VStack for group settings
            // profile Bio
            BioView(bioText: "Viverra aliquet eget sit amet tellus cras adipiscing enim.")
            
            // Group Info List
            VStack(spacing: 16) {
                NavigationLink(destination: SubscriberListView()) {
                    GroupInfoRow(title: "Subscribers", value: "10")
                }
                GroupInfoRow(title: "Group QR Code", value: "")
            }
            .frame(width: 350)
            .padding(.vertical, 10)
            
            // Create group button
            Button_Subscribe(price: 7){
                // Add your action here
                print("Create Group button pressed")
            }
        }
    
        .frame(width: 430, height: 932)
        .background(Color.white)
}
}

struct ProfileImageView: View {
    let url: String
    
    var body: some View {
        ZStack {
            Ellipse()
                .foregroundColor(.clear)
                .frame(width: 80, height: 80)
                .overlay(
                    Ellipse()
                        .inset(by: 1)
                        .stroke(Color(red: 0.93, green: 0.04, blue: 0.26), lineWidth: 1)
                )
                .offset(x: 0, y: 0)
        }
        .frame(width: 80, height: 80)
    }
}

struct GroupInfoRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(Font.custom("Rubik", size: 16))
                .foregroundColor(.black)
            Spacer()
            Text(value)
                .font(Font.custom("Rubik", size: 16))
                .foregroundColor(.gray)
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding(.vertical, 10)
        .onTapGesture {
            print("\(title) row tapped")
        }
    }
}

struct ProfileImagePlaceholder: View {
    var body: some View {
        ZStack {
            Ellipse()
                .foregroundColor(.clear)
                .frame(width: 80, height: 80)
                .background(Color.white)
                .overlay(
                    Ellipse()
                        .inset(by: 1)
                        .stroke(Color(red: 0.93, green: 0.04, blue: 0.26), lineWidth: 1)
                )
                .offset(x: 0, y: 0)
            HStack(spacing: 0) { }
                .padding(6.40)
                .frame(width: 38.40, height: 38.40)
                .offset(x: 0, y: 0)
        }
        .frame(width: 80, height: 80)
    }
}



struct TextFieldRow: View {
    let title: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(Font.custom("Rubik", size: 18))
                .foregroundColor(Color(red: 0, green: 0.15, blue: 0.29))
            
            TextField("", text: $text)
                .font(Font.custom("Rubik", size: 18))
                .padding(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
        }
        .padding(.vertical, 8)
    }
}







struct OtherGroupInfoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            OtherGroupInfoView()
        }
    }
}
