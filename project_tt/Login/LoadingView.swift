//
//  Loading.swift
//  project_tt
//
//  Created by Yi Y on 7/12/24.
//

import SwiftUI

struct LoadingView: View {
    @State private var isActive = false
    @State private var currentImage = "logo_only"
    
    let images = ["logo_only", "logo_left", "logo_right"]
    @State private var imageIndex = 0
    
    var body: some View {
        Group {
            if isActive {
                NavigationView {
                    SignInView()
                }
            } else {
                ZStack {
                    // Background Image
                    Image("background")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                    
                    // Center Placeholder
                    VStack {
                        // Logo
                        Image(currentImage) // Use the current image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 130, height: 130) // Adjust the size as needed
                            .offset(x: -10) // Move logo to the left by 10 points
                        
                        // App Name
                        Text("Sip")
                            .font(Font.custom("MerriweatherSans-Regular", size: 48).weight(.semibold))
                            .lineSpacing(72)
                    }
                    .frame(width: 316, height: 316)
                    .offset(y: -100) // Adjusted offset for better positioning
                }
                .frame(width: 430, height: 932)
                .background(Color.white)
                // .edgesIgnoringSafeArea(.top) // Ensure status bar is visible
                .onAppear {
                    startImageTransition()
                }
            }
        }
    }
    
    func startImageTransition() {
        Timer.scheduledTimer(withTimeInterval: 0.4, repeats: true) { timer in
            if imageIndex < images.count {
                currentImage = images[imageIndex]
                imageIndex += 1
            } else {
                timer.invalidate()
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}

