//
//  ContentView.swift
//  project_tt
//
//  Created by Yi Y on 7/16/24.
//

// paulallies.medium.com/google-sign-in-swiftui-2909e01ea4ed
// use ChatGPT to add preview

/*
import SwiftUI
import GoogleSignIn

// ContentView struct defines the user interface for the authentication screen
struct ContentView: View {
    @EnvironmentObject var vm: UserAuthModel  // Access the UserAuthModel instance from the environment
    
    // Function to create a Sign In button
    fileprivate func SignInButton() -> Button<Text> {
        Button(action: {
            vm.signIn()  // Call the signIn function when the button is pressed
        }) {
            Text("Sign In")
        }
    }
    
    // Function to create a Sign Out button
    fileprivate func SignOutButton() -> Button<Text> {
        Button(action: {
            vm.signOut()  // Call the signOut function when the button is pressed
        }) {
            Text("Sign Out")
        }
    }
    
    // Function to display the user's profile picture
    fileprivate func ProfilePic() -> some View {
        AsyncImage(url: URL(string: vm.profilePicUrl))
            .frame(width: 100, height: 100)
    }
    
    // Function to display the user's given name
    fileprivate func UserInfo() -> Text {
        return Text(vm.givenName)
    }
    
    var body: some View {
        VStack{
            UserInfo()  // Display the user's given name
            ProfilePic()  // Display the user's profile picture
            if(vm.isLoggedIn){
                SignOutButton()  // Show the Sign Out button if the user is logged in
            } else {
                SignInButton()  // Show the Sign In button if the user is not logged in
            }
            Text(vm.errorMessage)  // Display any error messages
        }
        .navigationTitle("Login")  // Set the navigation title
    }
}


// Preview provider to display ContentView in the Xcode preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserAuthModel())  // Provide a UserAuthModel instance for the preview
    }
}

*/
