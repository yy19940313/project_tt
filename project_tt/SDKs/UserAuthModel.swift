//
//  UserAuthModel.swift
//  project_tt
//
//  Created by Yi Y on 7/16/24.
// based on paulallies.medium.com/google-sign-in-swiftui-2909e01ea4ed

import SwiftUI
import GoogleSignIn

// UserAuthModel class is used to handle user authentication using Google Sign-In.
class UserAuthModel: ObservableObject {
    
    // Published properties to keep track of user data and authentication status
    @Published var givenName: String = ""      // Stores the user's given name
    @Published var familyName: String = ""     // Stores the user's family name
    @Published var email: String = ""          // Stores the user's email
    @Published var profilePicUrl: String = ""  // Stores the user's profile picture URL
    @Published var username: String = ""       // Stores the user's username
    @Published var isLoggedIn: Bool = false    // Indicates if the user is logged in
    @Published var isRegistered: Bool = false  // Indicates if the user is registered
    @Published var errorMessage: String = ""   // Stores any error messages
    
    // Initializer calls check() to restore previous sign-in status if possible
    init(){
        check()
    }
    
    // Checks the current sign-in status of the user
    func checkStatus(){
        if let user = GIDSignIn.sharedInstance.currentUser {  // If the user is signed in
            // Extract the user's given name, family name, email, and profile picture URL
            self.givenName = user.profile?.givenName ?? ""
            self.familyName = user.profile?.familyName ?? ""
            self.email = user.profile?.email ?? ""
            self.profilePicUrl = user.profile?.imageURL(withDimension: 100)?.absoluteString ?? ""
            self.isLoggedIn = true
            self.checkRegistration(email: self.email) // Check registration status
        } else {  // If the user is not signed in
            self.isLoggedIn = false
            self.givenName = "Not Logged In"
            self.familyName = ""
            self.email = ""
            self.profilePicUrl = ""
            self.isRegistered = false
        }
    }
    
    // Attempts to restore the previous sign-in session if it exists
    func check(){
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            if let error = error {
                self.errorMessage = "error: \(error.localizedDescription)"  // Handle any errors
            }
            
            self.checkStatus()  // Check the current sign-in status
        }
    }

    // Initiates the Google sign-in process
    func signIn(){
        // Get the presenting view controller
        guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {return}

        // Configuration for Google Sign-In with the client ID
        let signInConfig = GIDConfiguration(clientID: "238702151899-lq8i4aobpejqgdmvdf1ji22uo3u6ntht.apps.googleusercontent.com")
        
        GIDSignIn.sharedInstance.signIn(
            with: signInConfig,
            presenting: presentingViewController,
            callback: { user, error in
                if let error = error {
                    self.errorMessage = "error: \(error.localizedDescription)"  // Handle any errors
                }
                self.checkStatus()  // Check the current sign-in status after sign-in attempt
            }
        )
    }
    
    // Signs out the current user
    func signOut(){
        GIDSignIn.sharedInstance.signOut()
        self.checkStatus()  // Check the current sign-in status after sign-out
    }
    
    // Function to check if the email is already registered
    func checkRegistration(email: String) {
        // Replace with your backend URL
        let url = URL(string: "https://yourbackend.com/check_registration")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = ["email": email]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    self.errorMessage = "Network error: \(error?.localizedDescription ?? "Unknown error")"
                }
                return
            }
            
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            DispatchQueue.main.async {
                if let responseJSON = responseJSON, let isRegistered = responseJSON["isRegistered"] as? Bool {
                    self.isRegistered = isRegistered
                } else {
                    self.errorMessage = "Invalid response from server"
                }
            }
        }.resume()
    }
    
    // Function to set username
    func setUsername(username: String) {
        // Replace with your backend URL
        let url = URL(string: "https://yourbackend.com/set_username")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = ["email": self.email, "username": username]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    self.errorMessage = "Network error: \(error?.localizedDescription ?? "Unknown error")"
                }
                return
            }
            
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            DispatchQueue.main.async {
                if let responseJSON = responseJSON, let success = responseJSON["success"] as? Bool, success {
                    self.username = username
                } else {
                    self.errorMessage = "Failed to set username"
                }
            }
        }.resume()
    }
}
