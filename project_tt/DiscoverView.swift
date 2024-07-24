import SwiftUI

struct DiscoverView: View {
    @Binding var activePage: ActivePage
    
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
                    
                    Text("Discover")
                        .offset(x: 75)
                        .font(Font.custom("MerriweatherSans-Regular", size: 16).weight(.semibold))
                    
                    Spacer()
                    
                    Button(action: {
                        // Add new discover action
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
                
                // Discover List
                List {
                    DiscoverItemRow(itemName: "Interesting Article", description: "Latest trends in tech.", iconName: "book")
                    DiscoverItemRow(itemName: "Travel Blog", description: "Explore the world with us.", iconName: "airplane")
                    DiscoverItemRow(itemName: "Cooking Channel", description: "Delicious recipes to try.", iconName: "fork.knife")
                    // Add more DiscoverItemRow views as needed
                }
                .listStyle(PlainListStyle())
                
                Spacer()
                
                Divider()
                
                BottomNavigationView(activePage: $activePage)
                    .padding()
                    .frame(height: geometry.size.height * 0.08) // Set height to 8% of screen height
                    .background(Color.white) // Set background color to FFFFFF
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarHidden(true) // Hides the navigation bar
    }
}


struct DiscoverItemRow: View {
    let itemName: String
    let description: String // Added
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
                    Text(itemName)
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    Text(description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .padding(.vertical, 10)
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
