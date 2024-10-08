import SwiftUI

struct FollowersListView: View {
    @State private var showingActionSheet = false
    @State private var selectedUser: User? = nil

    var body: some View {
        List(followers) { user in
            HStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.gray)

                VStack(alignment: .leading) {
                    Text(user.handle)
                        .font(Font.custom("Rubik", size: 16).weight(.regular))

                    Text(user.name)
                        .font(Font.custom("Rubik", size: 16).weight(.regular))
                        .foregroundColor(.gray)
                }
                .padding(.leading, 10)

                Spacer()

                Button(action: {
                    selectedUser = user
                    showingActionSheet = true
                }) {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.gray)
                        .frame(width: 30, height: 30)
                }
                .actionSheet(isPresented: $showingActionSheet) {
                    ActionSheet(
                        title: Text("Options"),
                        message: Text("What do you want to do?"),
                        buttons: [
                            .destructive(Text("Remove Follower")) {
                                // Handle remove action
                                print("Remove \(selectedUser?.name ?? "")")
                            },
                            .destructive(Text("Block")) {
                                // Handle block action
                                print("Block \(selectedUser?.name ?? "")")
                            },
                            .cancel()
                        ]
                    )
                }
            }
            .padding(.vertical, 5)
        }
        .navigationTitle("Followers")
        .listStyle(PlainListStyle()) // Optional: Use plain style if default style adds padding
        .listRowInsets(EdgeInsets()) // Remove extra padding around rows
    }
}


// Sample data for followers
let followers = [
    User(handle: "@follower1", name: "Follower 1"),
    User(handle: "@follower2", name: "Follower 2"),
    User(handle: "@follower3", name: "Follower 3"),
    User(handle: "@follower4", name: "Follower 4"),
    User(handle: "@follower5", name: "Follower 5"),
    User(handle: "@follower6", name: "Follower 6"),
    User(handle: "@follower7", name: "Follower 7"),
    User(handle: "@follower8", name: "Follower 8"),
    User(handle: "@follower9", name: "Follower 9"),
    User(handle: "@follower10", name: "Follower 10")
]

struct FollowersListView_Previews: PreviewProvider {
    static var previews: some View {
        FollowersListView()
    }
}
