
import SwiftUI

class ProfileData: ObservableObject {
    @Published var name: String = ""
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var bio: String = ""
    @Published var subscribedChats: Int = 0
    @Published var followedPeople: Int = 0
    @Published var createdChats: Int = 0
    @Published var profileUIImage: UIImage? = nil
}




