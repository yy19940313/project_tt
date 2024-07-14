//
//  ChatView.swift
//  project_tt
//
//  Created by Catherine Chen on 7/12/24.
//


import SwiftUI

struct DashboardView: View {
    let chats = [
        ChatSummary(title: "U.S. Presidential Debate 2024"),
        ChatSummary(title: "The Three-Body Problem Bookclub"),
        ChatSummary(title: "Fantastic Beasts Fan Group")
    ]
    
    var body: some View {
        List(chats, id: \.title) { chat in
            NavigationLink(destination: Text(chat.title)) {
                Text(chat.title)
            }
        }
        .navigationTitle("Chat Dashboard")
    }
}

struct ChatSummary {
    var title: String
    
    // TODO: enrich chat summary
    // e.g. chat icon, chat author, etc.
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
