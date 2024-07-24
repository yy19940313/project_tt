//
//  ParentView.swift
//  project_tt
//
//  Created by Yi Y on 7/23/24.
//

import Combine
import SwiftUI


// The enum defines the possible states (pages).
enum ActivePage {
    case home
    case discover
    case profile
}

struct ParentView: View {
    @State private var activePage: ActivePage
    
    init(activePage: ActivePage = .home) {
        _activePage = State(initialValue: activePage)
    }

    var body: some View {
        NavigationView {
            VStack {
                switch activePage {
                case .home:
                    HomeView(activePage: $activePage)
                case .discover:
                    DiscoverView(activePage: $activePage)
                case .profile:
                    PersonalProfileView(activePage: $activePage)
                }
                // Bottom navigation bar
                BottomNavigationView(activePage: $activePage)
                    .padding(.bottom, 10) // Optional: Padding for aesthetics
            }
            .navigationBarHidden(true)
        }
    }
}


struct ParentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ParentView(activePage: .home)
                .previewDisplayName("Home")
            
            ParentView(activePage: .discover)
                .previewDisplayName("Discover")
            
            ParentView(activePage: .profile)
                .previewDisplayName("Profile")
        }
    }
}
