
import SwiftUI

struct HomeView: View {
    
    var body: some View {
            VStack {
                // Top Navigation Bar
                TopNavigation(title: "Chats")
                                
                // Chats List
                List {
                    GroupChatRow(chatName: "Family Group", latestMessage: "Hello everyone!", sender: "Alice:", iconName: "person.2.square") // Modified
                    GroupChatRow(chatName: "Friends Group", latestMessage: "Let's meet up.", sender: "Bob:", iconName: "person.3.square") // Modified
                    GroupChatRow(chatName: "Work Group", latestMessage: "Deadline is tomorrow.", sender: "Charlie:", iconName: "briefcase") // Modified
                    // Add more GroupChatRow views as needed
                }
                .listStyle(PlainListStyle())
                
                Spacer()

            } // ending VStack
            .navigationBarHidden(true) // Hides the navigation bar
            .edgesIgnoringSafeArea(.bottom)
        
    } //ending var body: some View
} // ending homeview

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
                        .font(Font.custom("Rubik", size: 16).weight(.regular))
                        .foregroundColor(.black)
                    
                    HStack {
                        Text(sender)
                            .font(Font.custom("Rubik", size: 14).weight(.regular))
                            .foregroundColor(.gray)
                        Text(latestMessage)
                            .font(Font.custom("Rubik", size: 14).weight(.regular))
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding(.vertical, 10)
        }
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
    }
}

