import SwiftUI

struct GroupMember: Identifiable {
    let id = UUID()
    let name: String
    let imageUrl: String
}

struct CreateOwnGroupView: View {
    private let groupMembers: [GroupMember] = [
        GroupMember(name: "Vivian", imageUrl: "https://via.placeholder.com/80x80"),
        GroupMember(name: "Anran", imageUrl: "https://via.placeholder.com/80x80"),
        GroupMember(name: "Fiona", imageUrl: "https://via.placeholder.com/80x80")
    ]
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                // Group setting header
                Text("Group Setting")
                    .font(Font.custom("Merriweather", size: 18).weight(.bold))
                    .lineSpacing(27)
                
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
                GroupSettingsView()
                
                // Create group button
                CreateGroupButton {
                    // Add your action here
                    print("Create Group button pressed")
                }
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
                .background(
                    AsyncImage(url: URL(string: url))
                )
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

struct GroupSettingsView: View {
    @State private var groupName: String = ""
    @State private var introduction: String = ""
    @State private var notifications: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            TextFieldRow(title: "Group Name", text: $groupName)
            TextFieldRow(title: "Introduction", text: $introduction)
            TextFieldRow(title: "Notifications", text: $notifications)
        }
        .padding(16)
        .frame(width: 382)
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

struct CreateGroupButton: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                Text("Create Group")
                    .font(Font.custom("Rubik", size: 18).weight(.bold))
                    .lineSpacing(27)
                    .foregroundColor(.white)
            }
            .padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24))
            .frame(width: 382, height: 48)
            .background(Color(red: 0.93, green: 0.04, blue: 0.26))
            .cornerRadius(32)
        }
    }
}


struct CreateOwnGroupView_Previews: PreviewProvider {
    static var previews: some View {
        CreateOwnGroupView()
    }
}
