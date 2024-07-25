//
//  SubscriberListView.swift
//  project_tt
//
//  Created by Yi Y on 7/24/24.
//

import SwiftUI

struct SubscriberListView: View {
    @State private var showingActionSheet = false
    @State private var selectedUser: User? = nil

    var body: some View {
        List(subscribers) { user in
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
                            .destructive(Text("Remove Subscriber")) {
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
        .navigationTitle("Subscribers")
        .listStyle(PlainListStyle()) // Optional: Use plain style if default style adds padding
        .listRowInsets(EdgeInsets()) // Remove extra padding around rows
    }
}


// Sample data for followers
let subscribers = [
    User(handle: "@subscriber1", name: "Subscriber 1"),
    User(handle: "@subscriber2", name: "Subscriber 2"),
    User(handle: "@subscriber3", name: "Subscriber 3"),
    User(handle: "@subscriber4", name: "Subscriber 4"),
    User(handle: "@subscriber5", name: "Subscriber 5"),
    User(handle: "@subscriber6", name: "Subscriber 6"),
    User(handle: "@subscriber7", name: "Subscriber 7"),
    User(handle: "@subscriber8", name: "Subscriber 8"),
    User(handle: "@subscriber9", name: "Subscriber 9"),
    User(handle: "@subscriber10", name: "Subscriber 10")
]
#Preview {
    SubscriberListView()
}
