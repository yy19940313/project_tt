
import SwiftUI

struct UsernameSettingView: View {
    @EnvironmentObject var userAuth: UserAuthModel
    @State private var newUsername: String = ""
    @State private var errorMessage: String?

    var body: some View {
        VStack {
            TextField("Enter your username", text: $newUsername)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }

            Button(action: {
                // Validate the username
                if newUsername.isEmpty {
                    errorMessage = "Username cannot be empty"
                    return
                }

                // Simulate a network request to check if the username is taken
                // This is where you would normally integrate your backend call
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    if newUsername == "takenUsername" {
                        errorMessage = "Username is already taken"
                    } else {
                        userAuth.username = newUsername
                        userAuth.needsUsername = false
                        userAuth.showProfile = true
                    }
                }
            }) {
                Text("Set Username")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
        }
        .padding()
        .navigationBarTitle("Set Username", displayMode: .inline)
    }
}

struct UsernameSettingView_Previews: PreviewProvider {
    static var previews: some View {
        UsernameSettingView().environmentObject(UserAuthModel())
    }
}


