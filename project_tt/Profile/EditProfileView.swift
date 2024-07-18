/*
import SwiftUI

struct EditProfileView: View {
    @ObservedObject var profileData: ProfileData
    @State private var showingPersonalProfile = false

    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            // Profile image placeholder
            ProfileImagePlaceholderView(profileUIImage: $profileData.profileUIImage)
                .frame(width: 100, height: 100)
                .padding(.top, 20)
            
            // Name field
            HStack {
                Text("Name:")
                    .font(.headline)
                    .foregroundColor(Color.black)
                Spacer()
                TextField("Enter name", text: $profileData.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(maxWidth: 250)
            }
            
            // Username field
            HStack {
                Text("Username:")
                    .font(.headline)
                    .foregroundColor(Color.black)
                Spacer()
                TextField("Enter username", text: $profileData.username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(maxWidth: 250)
            }
            
            // Bio field
            HStack {
                Text("Bio:")
                    .font(.headline)
                    .foregroundColor(Color.black)
                Spacer()
                TextField("Enter bio", text: $profileData.bio)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(maxWidth: 250)
            }
            
            // Statistics section
            HStack {
                StatisticView(label: "Subscribed Chats", count: $profileData.subscribedChats)
                StatisticView(label: "Followed People", count: $profileData.followedPeople)
                StatisticView(label: "Chats Created", count: $profileData.createdChats)
            }
            .padding(.top, 20)
            
            Spacer()
            
            // Save button
            NavigationLink(destination: PersonalProfileView(profileData: profileData), isActive: $showingPersonalProfile) {
                Button(action: {
                    // Handle save action
                    print("Profile saved")
                    showingPersonalProfile = true
                }) {
                    Text("Save")
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
        }
        .padding(.horizontal, 20)
        .navigationBarTitle("Edit Profile", displayMode: .inline)
    }
}

struct ProfileImagePlaceholderView: View {
    @Binding var profileUIImage: UIImage?
    @State private var showingImagePicker = false
    
    var body: some View {
        ZStack {
            if let profileUIImage = profileUIImage {
                Image(uiImage: profileUIImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
            } else {
                Circle()
                    .fill(Color.gray.opacity(0.3))
                Text("Add Image")
                    .foregroundColor(.white)
                    .font(.headline)
            }
        }
        .frame(width: 100, height: 100)
        .onTapGesture {
            showingImagePicker = true
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $profileUIImage)
        }
    }
}

struct StatisticView: View {
    let label: String
    @Binding var count: Int
    
    var body: some View {
        VStack {
            Text("\(count)")
                .font(.headline)
                .foregroundColor(Color.black)
            Text(label)
                .font(.subheadline)
                .foregroundColor(Color.gray)
        }
        .frame(maxWidth: .infinity)
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EditProfileView(profileData: ProfileData())
        }
    }
}
*/
