import SwiftUI

struct LandingView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showSignUp: Bool = false
    @State private var showHome: Bool = false // For navigation after successful login
    @EnvironmentObject var userAuth: UserAuthModel // Access the UserAuthModel from the environment
    
    var body: some View {
        NavigationView {
            ZStack {
                
                // Background Image
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer() // Adjust spacing as needed
                    HStack{
                        Image("logo_only") // Use the current image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100) // Adjust the size as needed
                            .offset(x: -10) // Move logo to the left by 10 points
                        
                        // App Name
                        Text("Sip")
                            .font(Font.custom("MerriweatherSans-Regular", size: 40).weight(.semibold))
                            .lineSpacing(72)
                        
                    }
                    
                    Text("You Belong to Every Conversation")
                        .font(Font.custom("Rubik", size: 20).weight(.medium))
                        .lineSpacing(1)
                    
                    Spacer()
                        .frame(minHeight: 10, idealHeight: 50, maxHeight: 100)
                        .fixedSize()
                    
                    // Continue with Google button
                    Button(action: {
                        userAuth.signIn()
                    }) {
                        HStack {
                            GeometryReader { geometry in
                                HStack {
                                    Image("google_icon") // Use the Google icon
                                        .resizable()
                                        .frame(width: 24, height: 24) // Adjust the size as needed
                                    Spacer()
                                        .frame(width: 8) // Adjust the space between icon and text
                                    Text("Continue with Google")
                                        .font(Font.custom("Rubik", size: 18).weight(.semibold))
                                        .foregroundColor(.black) // Text color black
                                }
                                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                            }
                        }
                        .padding()
                        .frame(width: 320, height: 48, alignment: .center)
                        .background(Color.white) // Button background white
                        .cornerRadius(32)
                        .shadow(color: Color.gray.opacity(0.5), radius: 4, x: 0, y: 2) // Add shadow for better visibility
                    }
                    .padding(.bottom, 10) // Add spacing below the button

                    // Continue with Email button
                    NavigationLink(destination: SignInView()) {
                        HStack {
                            GeometryReader { geometry in
                                HStack {
                                    Image("email_icon") // Use the Email icon
                                        .resizable()
                                        .frame(width: 24, height: 24) // Adjust the size as needed
                                    Spacer()
                                        .frame(width: 8) // Adjust the space between icon and text
                                    Text("Continue with Email")
                                        .font(Font.custom("Rubik", size: 18).weight(.semibold))
                                        .foregroundColor(.black) // Text color black
                                }
                                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                            }
                        }
                        .padding()
                        .frame(width: 320, height: 48, alignment: .center)
                        .background(Color.white) // Button background white
                        .cornerRadius(32)
                        .shadow(color: Color.gray.opacity(0.5), radius: 4, x: 0, y: 2) // Add shadow for better visibility
                    }
                    .padding(.bottom, 10) // Add spacing below the button
                    
                    // "Don't have an account? Sign Up" text
                    NavigationLink(isActive: $showSignUp) {
                        SignUpView()
                    } label: {
                        HStack {
                            Text("Don't have an account? ")
                                .font(Font.custom("Rubik", size: 14).weight(.light))
                                .foregroundColor(Color(red: 0, green: 0.15, blue: 0.29))
                            
                            Text("Sign Up")
                                .font(Font.custom("Rubik", size: 16).weight(.heavy))
                                .foregroundColor(Color(red: 0.93, green: 0.04, blue: 0.26)) // Increase font size and use heavier weight
                        }
                    }
                    .padding(.top, 10)
                    
                    Spacer()
                    
                    // NavigationLink to PersonalProfileView
                    NavigationLink(
                        destination: PersonalProfileView()
                            .environmentObject(userAuth), // Pass environment object
                        isActive: $userAuth.showProfile
                    ) {
                        EmptyView()
                    }

                }
                .padding(.horizontal, 30) // Adjust padding as needed
                
            }
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
            .navigationBarHidden(true)
        }
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
            .environmentObject(UserAuthModel()) // Provide the UserAuthModel for the preview
    }
}
