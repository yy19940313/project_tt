import SwiftUI
import GoogleSignIn

class UserAuthModel: ObservableObject {
    @Published var givenName: String = ""      // Stores the user's given name
    @Published var familyName: String = ""     // Stores the user's family name
    @Published var email: String = ""          // Stores the user's email
    @Published var profilePicUrl: String = ""  // Stores the user's profile picture URL
    @Published var username: String = ""       // Stores the user's username
    @Published var isLoggedIn: Bool = false    // Indicates if the user is logged in
    @Published var isRegistered: Bool = false  // Indicates if the user is registered
    @Published var errorMessage: String = ""   // Stores any error messages
    @Published var showProfile: Bool = false   // Indicates if the profile view should be shown
    @Published var needsUsername: Bool = false // Indicates if username needs to be set
    
    init(){
        check()
    }
    
    func checkStatus(){
        if let user = GIDSignIn.sharedInstance.currentUser {
            self.givenName = user.profile?.givenName ?? ""
            self.familyName = user.profile?.familyName ?? ""
            self.email = user.profile?.email ?? ""
            self.profilePicUrl = user.profile?.imageURL(withDimension: 100)?.absoluteString ?? ""
            self.isLoggedIn = true
            self.checkRegistration(email: self.email)
            self.showProfile = true
            self.needsUsername = self.username.isEmpty
        } else {
            self.isLoggedIn = false
            self.givenName = "Not Logged In"
            self.familyName = ""
            self.email = ""
            self.profilePicUrl = ""
            self.isRegistered = false
            self.showProfile = false
            self.needsUsername = false
        }
    }
    
    func check(){
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            if let error = error {
                self.errorMessage = "error: \(error.localizedDescription)"
            }
            self.checkStatus()
        }
    }

    func signIn(){
        guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {return}

        let signInConfig = GIDConfiguration(clientID: "238702151899-lq8i4aobpejqgdmvdf1ji22uo3u6ntht.apps.googleusercontent.com")
        
        GIDSignIn.sharedInstance.signIn(
            with: signInConfig,
            presenting: presentingViewController,
            callback: { user, error in
                if let error = error {
                    self.errorMessage = "error: \(error.localizedDescription)"
                }
                self.checkStatus()
            }
        )
    }
    
    func signOut(){
        GIDSignIn.sharedInstance.signOut()
        self.checkStatus()
    }
    
    func checkRegistration(email: String) {
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
    
    func setUsername(username: String) {
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
