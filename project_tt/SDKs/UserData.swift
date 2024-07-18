//
//  UserData.swift
//  project_tt
//
//  Created by Yi Y on 7/16/24.
//


import Foundation
import GoogleSignIn

fileprivate let clientID = "238702151899-lq8i4aobpejqgdmvdf1ji22uo3u6ntht"
fileprivate let grayAvatorImage: UIImage = UIImage(named: "PlaceholderAvatar")!

class UserData: NSObject, ObservableObject {

    @Published var user: GIDGoogleUser?
    @Published var avatorImage: UIImage = grayAvatorImage
    
    var signInConfig = GIDConfiguration.init(clientID: clientID)
    
    var isSignedIn: Bool {
        return GIDSignIn.sharedInstance.currentUser?.authentication != nil
    }

    var userName: String {
        if isSignedIn, let profile = user?.profile {
            return profile.name
        }
        else {
            return "< User name >"
        }
    }
    
    var email: String {
        if isSignedIn, let profile = user?.profile {
            return profile.email
        }
        else {
            return "< Email address >"
        }
    }
    
    func signIn(user: GIDGoogleUser?) {
        self.user = user
        
        guard let user = user, let imageURL = user.profile?.imageURL(withDimension: 50) else {
            self.avatorImage = grayAvatorImage
            return
        }
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: imageURL)
            DispatchQueue.main.async {
                guard let data = data, let imageData = UIImage(data: data) else {
                    self.avatorImage = grayAvatorImage
                    return
                }
                
                self.avatorImage = imageData
            }
        }
        
    }
}

