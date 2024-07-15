import SwiftUI

struct PersonalProfileView: View {
    @ObservedObject var profileData: ProfileData

    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            // Profile image
            if let profileUIImage = profileData.profileUIImage {
                Image(uiImage: profileUIImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .padding(.top, 20)
            } else {
                ProfileImagePlaceholderView(profileUIImage: $profileData.profileUIImage)
                    .frame(width: 100, height: 100)
                    .padding(.top, 20)
            }

            // Name
            HStack {
                Text("Name:")
                    .font(.headline)
                    .foregroundColor(Color.black)
                Spacer()
                Text(profileData.name)
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
            }
            
            // Username
            HStack {
                Text("Username:")
                    .font(.headline)
                    .foregroundColor(Color.black)
                Spacer()
                Text(profileData.username)
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
            }
            
            // Bio
            HStack {
                Text("Bio:")
                    .font(.headline)
                    .foregroundColor(Color.black)
                Spacer()
                Text(profileData.bio)
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
            }
            
            // Statistics section
            HStack {
                StatisticView(label: "Subscribed Chats", count: $profileData.subscribedChats)
                StatisticView(label: "Followed People", count: $profileData.followedPeople)
                StatisticView(label: "Chats Created", count: $profileData.createdChats)
            }
            .padding(.top, 20)
            
            Spacer()
            
            // Edit Profile button
            NavigationLink(destination: EditProfileView(profileData: profileData)) {
                Text("Edit Profile")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
        }
        .padding(.horizontal, 20)
        .navigationBarTitle("Personal Profile", displayMode: .inline)
    }
}

struct PersonalProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PersonalProfileView(profileData: ProfileData())
        }
    }
}
