import SwiftUI

struct BottomNavigationView: View {
    @Binding var activePage: ActivePage

    var body: some View {
        HStack {
            Button(action: {
                activePage = .home
                print("Active Page set to: \(activePage)")
            }) {
                VStack {
                    Image(systemName: "message")
                        .font(.system(size: 20))
                        .foregroundColor(activePage == .home ? .black : .gray)
                    Text("Home")
                        .font(.system(size: 14))
                        .foregroundColor(activePage == .home ? .black : .gray)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .contentShape(Rectangle())
            }
            
            Button(action: {
                activePage = .discover
                print("Active Page set to: \(activePage)")
            }) {
                VStack {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 20))
                        .foregroundColor(activePage == .discover ? .black : .gray)
                    Text("Discover")
                        .font(.system(size: 14))
                        .foregroundColor(activePage == .discover ? .black : .gray)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .contentShape(Rectangle())
            }
            
            Button(action: {
                activePage = .profile
                print("Active Page set to: \(activePage)")
            }) {
                VStack {
                    Image(systemName: "person")
                        .font(.system(size: 20))
                        .foregroundColor(activePage == .profile ? .black : .gray)
                    Text("Profile")
                        .font(.system(size: 14))
                        .foregroundColor(activePage == .profile ? .black : .gray)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .contentShape(Rectangle())
            }
        }
        .padding()
        .frame(height: 60)
        .background(Color.white)
        .edgesIgnoringSafeArea(.bottom)
    }
}


struct BottomNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BottomNavigationView(activePage: .constant(.home))
                .previewLayout(.sizeThatFits)
        }
    }
}
