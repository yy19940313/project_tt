import SwiftUI

struct InputField: View {
    var label: String
    var placeholder: String
    @Binding var text: String
    var isSecure: Bool = false
    var errorMessage: String? = nil // Add an optional error message

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .font(Font.custom("Rubik", size: 14).weight(.light))
            if isSecure {
                SecureField(placeholder, text: $text)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(red: 0.90, green: 0.91, blue: 0.93), lineWidth: 0.50)
                    )
            } else {
                TextField(placeholder, text: $text)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(red: 0.90, green: 0.91, blue: 0.93), lineWidth: 0.50)
                    )
            }
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .font(Font.custom("Rubik", size: 12).weight(.light))
                    .foregroundColor(.red)
                    .padding(.top, 2)
            }
        }
    }
}

struct SignUpView: View {
    @State private var name: String = ""
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @ObservedObject var profileData = ProfileData()
    @State private var showingPersonalProfile = false
    @State private var emailError: String? = nil // For storing email validation error message

    var body: some View {
        ZStack {
            // Background Color
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)

            VStack {
                Spacer() // Adjust spacing as needed

                Text("Create a Sip Account")
                    .font(Font.custom("Rubik", size: 24).weight(.bold))
                    .padding(.bottom, 20)

                // Name input fields
                VStack(alignment: .leading, spacing: 12) {
                    InputField(label: "Name", placeholder: "Enter your name", text: $name)
                    InputField(label: "Username", placeholder: "Enter your username", text: $username)
                    InputField(label: "Email Address", placeholder: "Enter your email", text: $email, errorMessage: emailError)
                    InputField(label: "Password", placeholder: "Enter your password", text: $password, isSecure: true)
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 20)

                // Sign up button
                // Reset Password button
                Button(action: {
                    // Add your reset password logic here
                    print("Sign Up: \(email)")
                }) {
                    Text("Sign Up")
                        .font(Font.custom("Rubik", size: 18).weight(.bold))
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 320, height: 48)
                        .background(Color(red: 0.93, green: 0.04, blue: 0.26))
                        .cornerRadius(32)
                }
                .padding(.top, 20)

                // "Already have an account? Sign In" text with NavigationLink
                NavigationLink(destination: SignInView()) {
                    Text("Already have an account? ")
                        .font(Font.custom("Rubik", size: 14).weight(.light)) +
                    Text("Sign In")
                        .font(Font.custom("Rubik", size: 16).weight(.heavy))
                        .foregroundColor(Color(red: 0.93, green: 0.04, blue: 0.26))
                }
                .foregroundColor(Color(red: 0, green: 0.15, blue: 0.29))
                .padding(.top, 10)

                Spacer()
            }
            .padding(.horizontal, 30) // Adjust padding as needed
        }
    }

    // Function to handle sign up action
    private func signUp() {
        if isValidEmail(email) {
            emailError = nil
            profileData.name = name
            profileData.username = username
            profileData.email = email
            profileData.password = password

            print("Name: \(name)")
            print("Username: \(username)")
            print("Email: \(email)")
            print("Password: \(password)")

            showingPersonalProfile = true
        } else {
            emailError = "Email address format is incorrect"
        }
    }

    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SignUpView()
        }
    }
}
