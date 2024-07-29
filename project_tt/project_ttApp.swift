//
//  project_ttApp.swift
//  project_tt
//
//  Created by Yi Y on 7/11/24.
//

import SwiftUI

/*
// start with loading page

@main
struct project_ttApp: App {

    var body: some Scene {
        WindowGroup {
            LoadingView()
        }
    }
}
*/




// start with landing page

@main
struct project_ttApp: App {
    @StateObject private var userAuth = UserAuthModel()

    var body: some Scene {
        WindowGroup {
                LandingView()
                    .environmentObject(userAuth)
        }
    }
}

        

// start with landing page

/*
@main
struct YourApp: App {
    var body: some Scene {
        WindowGroup {
            AppView_Supabase()
        }
    }
}
*/
