
import SwiftUI



struct CreateGroupView: View {
    private let groupMembers: [GroupMember] = [
        GroupMember(name: "Vivian", imageUrl: "https://via.placeholder.com/80x80"),
        GroupMember(name: "Anran", imageUrl: "https://via.placeholder.com/80x80"),
        GroupMember(name: "Fiona", imageUrl: "https://via.placeholder.com/80x80")
    ]
    
    var body: some View {
        ZStack {
            
            VStack {
                // Group setting header
                Text("Group Information")
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


struct CreateGroupView_Previews: PreviewProvider {
    static var previews: some View {
        CreateGroupView()
    }
}
