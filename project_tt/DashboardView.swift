import SwiftUI

struct DashboardView: View {
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                // Navigation Bar
                HStack {
                    Image("logo_name") // Use the current image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 50) // Adjust the size as needed
                        .offset(x: 10)
                    
                    Text("All Chats")
                        .offset(x: 60)
                        .font(Font.custom("MerriweatherSans-Regular", size: 16).weight(.semibold))
                    
                    Spacer()
                    
                    Button(action: {
                        // Add new chat action
                    }) {
                        Image(systemName: "plus")
                            .font(.title)
                            .foregroundColor(Color(red: 0.93, green: 0.04, blue: 0.26)) // Added color ED0942
                    }
                    .padding(.trailing, 20)
                }
                .padding(.top, 0)
                .padding(.bottom, 0)
                
                Divider()
                
                // Chats List
                List {
                    GroupChatRow(chatName: "Family Group", latestMessage: "Hello everyone!", sender: "Alice:", iconName: "person.2.square") // Modified
                    GroupChatRow(chatName: "Friends Group", latestMessage: "Let's meet up.", sender: "Bob:", iconName: "person.3.square") // Modified
                    GroupChatRow(chatName: "Work Group", latestMessage: "Deadline is tomorrow.", sender: "Charlie:", iconName: "briefcase") // Modified
                    // Add more GroupChatRow views as needed
                }
                .listStyle(PlainListStyle())
                
                Spacer()
                
                Divider()
                
                BottomNavigationView()
                    .padding()
                    .frame(height: geometry.size.height * 0.08) // Set height to 8% of screen height
                    .background(Color.white) // Set background color to FFFFFF
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct GroupChatRow: View {
    let chatName: String
    let latestMessage: String // Added
    let sender: String // Added
    let iconName: String // Added
    
    var body: some View {
        HStack {
            HStack(alignment: .top, spacing: 20) { // Modified
                Image(systemName: iconName)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                
                VStack(alignment: .leading) { // Modified
                    Text(chatName)
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    HStack {
                        Text(sender)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text(latestMessage)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding(.vertical, 10)
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DashboardView()
        }
    }
}
