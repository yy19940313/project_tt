import SwiftUI

struct DiscoverView: View {
    @Binding var activePage: ActivePage
    @State private var searchText: String = ""
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                // Top Navigation and Search Bar
                TopNavigation(title: "Discover")
                
                // Search Bar
                HStack {
                    TextField("Search for a Group", text: $searchText)
                        .padding(7)
                        .padding(.horizontal, 25)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
                
                
                // Discover List
                List {
                    NavigationLink(destination: OtherGroupInfoView()) {
                        DiscoverItemRow(itemName: "Oppenhomie", description: "Chat amongst the cast of the movie Oppenhemie.", imageName: "chat_logo_oppen")
                    }
                    DiscoverItemRow(itemName: "Travel Blog", description: "Explore the world with us.", imageName: "airplane")
                    DiscoverItemRow(itemName: "Cooking Channel", description: "Delicious recipes to try.", imageName: "fork.knife")
                    // Add more DiscoverItemRow views as needed
                }
                .listStyle(PlainListStyle())
                
                Spacer()
                
                
                BottomNavigationView(activePage: $activePage)
                    .padding()
                    .frame(height: geometry.size.height * 0.08) // Set height to 8% of screen height
                    .background(Color.white) // Set background color to FFFFFF
            }
            .navigationBarHidden(true) // Hides the navigation bar
        }
        .edgesIgnoringSafeArea(.bottom)
        
    }
}


struct DiscoverItemRow: View {
    let itemName: String
    let description: String
    let imageName: String

    var body: some View {
        HStack {
            HStack(alignment: .top, spacing: 20) {
                Image(imageName) // Using the image asset named "logo"
                    .resizable()
                    .frame(width: 50, height: 50)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                
                VStack(alignment: .leading) {
                    Text(itemName)
                        .font(Font.custom("Rubik", size: 16).weight(.regular))
                        .foregroundColor(.black)
                    
                    Text(description)
                        .font(Font.custom("Rubik", size: 14).weight(.regular))
                        .foregroundColor(.gray)
                }
            }
            .padding(.vertical, 5)
        }
    }
}


struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DiscoverView(activePage: .constant(.discover))
        }
    }
}
