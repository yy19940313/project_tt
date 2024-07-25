//
//  SubscribingListView.swift
//  project_tt
//
//  Created by Yi Y on 7/24/24.
//

import SwiftUI

struct SubscribingListView: View {
    @State private var showingActionSheet = false
    @State private var selectedGroup: GroupChat? = nil

    var body: some View {
        List(subscribingGroups) { group in
            HStack {
                Image(systemName: "person.3.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.gray)

                VStack(alignment: .leading) {
                    Text(group.name)
                        .font(Font.custom("Rubik", size: 16).weight(.medium))
                    Text("\(group.memberCount) subscribers")
                        .font(Font.custom("Rubik", size: 14).weight(.regular))
                        .foregroundColor(.gray)
                }
                .padding(.leading, 10)

                Spacer()

                Button(action: {
                    selectedGroup = group
                    showingActionSheet = true
                }) {
                    Image(systemName: "ellipsis")
                        .frame(width: 30, height: 30)
                        .foregroundColor(.gray)
                }
                .actionSheet(isPresented: $showingActionSheet) {
                    ActionSheet(
                        title: Text("Options"),
                        message: Text("What do you want to do?"),
                        buttons: [
                            .destructive(Text("Leave Group")) {
                                // Handle leave group action
                                print("Leave \(selectedGroup?.name ?? "")")
                            },
                            .cancel()
                        ]
                    )
                }
            }
            .padding(.vertical, 5)
        }
        .navigationTitle("Subscribing")
        .listStyle(PlainListStyle()) // Optional: Use plain style if default style adds padding
        .listRowInsets(EdgeInsets()) // Remove extra padding around rows
    }
}

// Sample data for subscribing groups
struct GroupChat: Identifiable {
    var id = UUID()
    var name: String
    var memberCount: Int
}

let subscribingGroups = [
    GroupChat(name: "Tech Enthusiasts", memberCount: 120),
    GroupChat(name: "Book Club", memberCount: 45),
    GroupChat(name: "Travel Buddies", memberCount: 75)
]

struct SubscribingListView_Previews: PreviewProvider {
    static var previews: some View {
        SubscribingListView()
    }
}
