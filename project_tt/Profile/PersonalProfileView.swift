import SwiftUI

import SwiftUI

struct PersonalProfileView: View {
    @State private var showingSettings = false
    
    var body: some View {
            VStack {
                // Top bar
                ProfileTopNavigation()
                
                // Profile Picture with Ellipse
                VStack {
                    ZStack {
                        Circle()
                            .stroke(Color(red: 0.93, green: 0.04, blue: 0.26), lineWidth: 4)
                            .frame(width: 100, height: 100)
                            .overlay(
                                Image("vivian_icon")
                                    .resizable()
                                    .scaledToFill()
                                    .clipShape(Circle())
                            )
                    }
                    
                    Text("Vivian")
                        .font(Font.custom("Merriweather", size: 24).weight(.bold))
                        .foregroundColor(Color(red: 0, green: 0.15, blue: 0.29))
                        .padding(.top, 8)
                    
                    Text("@vivianxyz")
                        .font(Font.custom("Rubik", size: 16).weight(.light))
                        .foregroundColor(Color(red: 0, green: 0.15, blue: 0.29))
                    
                    HStack(alignment: .top, spacing: 16) {
                        NavigationLink(destination: SubscribingListView()) {
                            StatView(number: "13", label: "Subscribing")
                        }
                        NavigationLink(destination: FollowingListView()) {
                            StatView(number: "12", label: "Following")
                        }
                        NavigationLink(destination: FollowersListView()) {
                            StatView(number: "8", label: "Followers")
                        }
                    }
                    .padding(.top, 5) // Adjust top padding to align properly
                    .padding(.bottom, 5) // Adjust top padding to align properly
                }

                // profile Bio
                BioView(bioText: "Viverra aliquet eget sit amet tellus cras adipiscing enim.")
                
                // edit profile button
                EditProfileButton()

                Spacer()

            }
            .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.bottom)
    } // ending var body
} // ending PersonalProfileView




// Custom View for Statistics
struct StatView: View {
    var number: String
    var label: String
    
    var body: some View {
        VStack(spacing: 2) {
            Text(number)
                .font(Font.custom("Rubik", size: 18).weight(.semibold))
                .foregroundColor(Color(red: 0, green: 0.15, blue: 0.29))
            
            Text(label)
                .font(Font.custom("Rubik", size: 12).weight(.light))
                .foregroundColor(Color(red: 0, green: 0.15, blue: 0.29))
                .multilineTextAlignment(.center)
        }
        .frame(width: 80)
    }
}



struct PersonalProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PersonalProfileView()
        }
    }
}

