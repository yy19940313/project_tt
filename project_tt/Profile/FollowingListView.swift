//
//  FollowingListView.swift
//  project_tt
//
//  Created by Yi Y on 7/23/24.
//

import SwiftUI

struct FollowingListView: View {
    @State private var showingActionSheet = false
    @State private var selectedUser: User? = nil

    var body: some View {
        List(users) { user in
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
                            .destructive(Text("Stop Following")) {
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
        .navigationTitle("Following")
    }
}

struct User: Identifiable {
    var id = UUID()
    var handle: String
    var name: String
}

// Sample data
let users = [
    User(handle: "@handle1", name: "Name 1"),
    User(handle: "@handle2", name: "Name 2"),
    User(handle: "@handle3", name: "Name 3")
]

struct FollowingListView_Previews: PreviewProvider {
    static var previews: some View {
        FollowingListView()
    }
}
