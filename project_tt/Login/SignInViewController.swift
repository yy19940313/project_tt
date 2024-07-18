//
//  SignInViewController.swift
//  project_tt
//
//  Created by Yi Y on 7/16/24.
// based on paulallies.medium.com/google-sign-in-swiftui-2909e01ea4ed

/*
import GoogleSignIn
import GoogleSignInSwift
import SwiftUI

class SignInViewModel: ObservableObject {
    @Published var isSignedIn: Bool = false
    @Published var user: GIDGoogleUser?

    private let clientID = "238702151899-lq8i4aobpejqgdmvdf1ji22uo3u6ntht.apps.googleusercontent.com" // Replace with your actual Client ID

    func signIn() {
        let signInConfig = GIDConfiguration(clientID: clientID)

        guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {
            print("Error: No presenting view controller")
            return
        }

        GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController) { result, error in
            if let error = error {
                print("Error during sign in: \(error.localizedDescription)")
                return
            }

            guard let user = result?.user else {
                print("No user information retrieved")
                return
            }

            self.user = user
            self.isSignedIn = true
            // Handle additional sign-in logic here
        }
    }
}
*/
