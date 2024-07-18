//
//  project_ttApp.swift
//  project_tt
//
//  Created by Yi Y on 7/11/24.
//



/*
 
import SwiftUI
// proper loading screen
@main
struct project_ttApp: App {

    var body: some Scene {
        WindowGroup {
            LoadingView()
        }
    }
}
*/

import SwiftUI

@main
struct YourApp: App {
    @StateObject private var userAuth = UserAuthModel()
    
    var body: some Scene {
        WindowGroup {
            LandingView()
                .environmentObject(userAuth)
        }
    }
}
