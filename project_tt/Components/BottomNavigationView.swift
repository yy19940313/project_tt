import SwiftUI

struct BottomNavigationView: View {
    
    var body: some View {
        HStack {
            NavigationLink(destination: DashboardView()) {
                VStack {
                    Image(systemName: "message")
                        .font(.system(size: 20)) // Adjusted icon size
                        .foregroundColor(.gray) // Color for icons
                    Text("Chats")
                        .font(.system(size: 14)) // Adjusted font size
                        .foregroundColor(.gray) // Color for text
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity) // Ensure full width and height for touch area
                .contentShape(Rectangle()) // Make the entire area tappable
            }
            
            NavigationLink(destination: PersonalProfileView()) {
                VStack {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 20)) // Adjusted icon size
                        .foregroundColor(.gray) // Color for icons
                    Text("Explore")
                        .font(.system(size: 14)) // Adjusted font size
                        .foregroundColor(.gray) // Color for text
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity) // Ensure full width and height for touch area
                .contentShape(Rectangle()) // Make the entire area tappable
            }
            
            NavigationLink(destination: PersonalProfileView()) {
                VStack {
                    Image(systemName: "person")
                        .font(.system(size: 20)) // Adjusted icon size
                        .foregroundColor(.gray) // Color for icons
                    Text("Profile")
                        .font(.system(size: 14)) // Adjusted font size
                        .foregroundColor(.gray) // Color for text
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity) // Ensure full width and height for touch area
                .contentShape(Rectangle()) // Make the entire area tappable
            }
        }
        .padding()
        .frame(height: 60) // Set fixed height
        .background(Color.white) // Set background color to FFFFFF
        .shadow(color: .gray.opacity(0.4), radius: 3, x: 0, y: -1) // Optional: Add a shadow for better visibility
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct BottomNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView { // Ensure NavigationView is present in the preview
            BottomNavigationView()
                .previewLayout(.sizeThatFits)
        }
    }
}
