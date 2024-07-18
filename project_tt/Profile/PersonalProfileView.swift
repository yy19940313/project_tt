import SwiftUI
/*
struct PersonalProfileView: View {
    @ObservedObject var userAuth: UserAuthModel // Use the UserAuthModel to get profile data
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            // Profile image
            if let url = URL(string: userAuth.profilePicUrl) {
                AsyncImage(url: url)
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .padding(.top, 20)
            } else {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.gray)
                    .padding(.top, 20)
            }

            // Name
            HStack {
                Text("Name:")
                    .font(.headline)
                    .foregroundColor(Color.black)
                Spacer()
                Text("\(userAuth.givenName) \(userAuth.familyName)")
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
            }
            
            // Username
            HStack {
                Text("Username:")
                    .font(.headline)
                    .foregroundColor(Color.black)
                Spacer()
                Text(userAuth.username)
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
            }
            
            // Bio (optional)
            HStack {
                Text("Bio:")
                    .font(.headline)
                    .foregroundColor(Color.black)
                Spacer()
                Text("Bio goes here...") // Replace with actual bio if available
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
            }
            
            // Statistics section (optional)
            HStack {
                VStack {
                    Text("Subscribed Chats")
                        .font(.headline)
                    Text("0") // Replace with actual count if available
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                }
                Spacer()
                VStack {
                    Text("Followed People")
                        .font(.headline)
                    Text("0") // Replace with actual count if available
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                }
                Spacer()
                VStack {
                    Text("Chats Created")
                        .font(.headline)
                    Text("0") // Replace with actual count if available
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                }
            }
            .padding(.top, 20)
            
            Spacer()
            
            // Edit Profile button
            NavigationLink(destination: EditProfileView(userAuth: userAuth)) {
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
            PersonalProfileView(userAuth: UserAuthModel())
        }
    }
}
*/
