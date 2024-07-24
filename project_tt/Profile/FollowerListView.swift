import SwiftUI

struct FollowersListView: View {
    @State private var showingActionSheet = false
    @State private var selectedUser: User? = nil

    var body: some View {
        List(followers) { user in
            HStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.gray)

                VStack(alignment: .leading) {
                    Text(user.handle)
                        .font(.headline)

                    Text(user.name)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.leading, 10)

                Spacer()

                Button(action: {
                    selectedUser = user
                    showingActionSheet = true
                }) {
                    Image(systemName: "ellipsis")
                        .font(.title)
                        .foregroundColor(.gray)
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
    }
}


// Sample data for followers
let followers = [
    User(handle: "@follower1", name: "Follower 1"),
    User(handle: "@follower2", name: "Follower 2"),
    User(handle: "@follower3", name: "Follower 3")
]

struct FollowersListView_Previews: PreviewProvider {
    static var previews: some View {
        FollowersListView()
    }
}
