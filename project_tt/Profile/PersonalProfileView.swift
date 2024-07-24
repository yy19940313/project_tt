import SwiftUI

struct PersonalProfileView: View {
    @State private var showingSettings = false
    @Binding var activePage: ActivePage
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Background Image
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            showingSettings.toggle()
                        }) {
                            Image(systemName: "list.bullet")
                                .font(.system(size: 22)) // Set a smaller size, for example, 15
                                .foregroundColor(Color(red: 0.93, green: 0.04, blue: 0.26)) // Added color ED0942
                        }
                        .padding(.trailing, 20)
                        .sheet(isPresented: $showingSettings) {
                            PersonalSettingsView()
                                .presentationDetents([.fraction(2/3)]) // Set the height of the modal to 2/3 of the screen
                        }
                    }
                    .padding(.top, 0)
                    .padding(.bottom, 0)
                    
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
                            NavigationLink(destination: HomeView(activePage: $activePage)) {
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
                    
                    // White Background for Profile Details
                    VStack(spacing: 16) {
                        // Bio Text
                        Text("Viverra aliquet eget sit amet tellus cras adipiscing enim.")
                            .font(Font.custom("Rubik", size: 16))
                            .foregroundColor(Color(red: 0, green: 0.15, blue: 0.29))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                            .padding(.top, 20) // Adjust top padding to align properly
                            .padding(.bottom, 20) // Adjust top padding to align properly
                    }
                    .padding(.horizontal)
                    .background(Color.white)
                    .cornerRadius(16)
                    .padding(.top, 5) // Adjust top padding to align properly
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
                    .padding(.horizontal, 16)
                    
                    VStack(spacing: 16) {
                        Text("Edit Profile")
                            .font(Font.custom("Rubik", size: 18).weight(.medium))
                            .foregroundColor(Color(red: 0, green: 0.15, blue: 0.29))
                            .frame(width: 200, height: 30)
                            .background(Color.green.opacity(0.7))
                            .cornerRadius(32)
                    }.padding()
                    
                    
                    Spacer()

                    // Bottom Navigation
                    BottomNavigationView(activePage: $activePage)
                        .padding()
                        .frame(height: geometry.size.height * 0.08) // Set height to 8% of screen height
                        .background(Color.white) // Set background color to FFFFFF
                        .onAppear {
                            print("PersonalProfileView loaded with activePage: \(activePage)")
                        }
                }
                .padding(.bottom, geometry.size.height * 0.08) // Ensure VStack doesn't overlap the BottomNavigationView
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarHidden(true) // Hides the navigation bar
    }
}


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
            PersonalProfileView(activePage: .constant(.profile))
        }
    }
}

