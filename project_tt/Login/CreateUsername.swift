/*
 import SwiftUI
 
 struct CreateUsername: View {
 @State private var username: String = ""
 @EnvironmentObject var userAuth: UserAuthModel // Access the UserAuthModel from the environment
 @State private var showProfile: Bool = false
 
 var body: some View {
 ZStack {
 Image("background")
 .resizable()
 .scaledToFill()
 .edgesIgnoringSafeArea(.all)
 VStack {
 Text("Set Username")
 .font(Font.custom("Rubik", size: 24).weight(.bold))
 .padding(.bottom, 20)
 
 // Username input field
 VStack(alignment: .leading, spacing: 4) {
 Text("Username")
 .font(Font.custom("Rubik", size: 14).weight(.light))
 .foregroundColor(Color(red: 0, green: 0.15, blue: 0.29).opacity(0.60))
 TextField("Enter your preferred username", text: $username)
 .padding()
 .background(Color.white)
 .cornerRadius(8)
 .overlay(
 RoundedRectangle(cornerRadius: 8)
 .stroke(Color(red: 0.90, green: 0.91, blue: 0.93), lineWidth: 0.50)
 )
 }
 .padding(.horizontal, 30)
 .padding(.bottom, 20)
 
 // Set Username button
 Button(action: {
 userAuth.setUsername(username: username)
 showProfile = true
 }) {
 Text("Set Username")
 .font(Font.custom("Rubik", size: 18).weight(.bold))
 .foregroundColor(.white)
 .padding()
 .frame(width: 320, height: 48)
 .background(Color(red: 0.93, green: 0.04, blue: 0.26))
 .cornerRadius(32)
 }
 .padding(.top, 20)
 
 NavigationLink(destination: PersonalProfileView(userAuth: userAuth), isActive: $showProfile) {
 EmptyView()
 }
 
 Spacer()
 }
 .padding(.horizontal, 30)
 .padding(.top, 100)
 }
 }
 }
 
 
 struct CreateUsername_Previews: PreviewProvider {
 static var previews: some View {
 CreateUsername()
 .environmentObject(UserAuthModel()) // Provide the UserAuthModel for the preview
 }
 }
 */
