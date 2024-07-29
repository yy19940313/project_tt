//
//  MainView.swift
//  project_tt
//
//  Created by Yi Y on 7/28/24.
//

import SwiftUI


struct MainView: View {
    @StateObject var model = Model()
    @State var tabSelection = 0
    
    var body: some View {
        TabView (selection: $model.tabViewSelectedIndex) {
            HomeView()
                .tag(0)
                .tabItem{
                    Label {
                        Text("Home")
                            .font(.system(size: 12))
                    } icon: {
                        Image(systemName: "message")
                            .imageScale(.small)
                    }
                }
            
            DiscoverView()
                .tag(1)
                .tabItem{
                    Label {
                        Text("Explore")
                            .font(.system(size: 12))
                    } icon: {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                    }
                }
            
            PersonalProfileView()
                .tag(2)
                .tabItem{
                    Label {
                        Text("Profile")
                            .font(.system(size: 12))
                    } icon: {
                        Image(systemName: "person")
                            .imageScale(.small)
                    }
                }
        }
        .onAppear {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            
            // Set transparent background
            appearance.backgroundColor = .clear
            
            // Remove shadow/divider
            appearance.shadowImage = UIImage()
            appearance.shadowColor = .clear
            
            // Set the selected tab item color
            let selectedColor = UIColor(red: 0.93, green: 0.04, blue: 0.26, alpha: 1.0)
            appearance.stackedLayoutAppearance.selected.iconColor = selectedColor
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: selectedColor]
            
            // Apply the appearance to the tab bar
            UITabBar.appearance().standardAppearance = appearance
            if #available(iOS 15.0, *) {
                UITabBar.appearance().scrollEdgeAppearance = appearance
            }
        }
        .environmentObject(model)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
