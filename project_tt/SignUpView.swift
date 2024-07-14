import SwiftUI

struct InputField: View {
    var label: String
    var placeholder: String
    @Binding var text: String
    var isSecure: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .font(Font.custom("Rubik", size: 14).weight(.light))
            if isSecure {
                SecureField(placeholder, text: $text)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
            } else {
                TextField(placeholder, text: $text)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
            }
        }
    }
}

struct SignUpView: View {
    @State private var name: String = ""
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            // Background Color
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer() // Adjust spacing as needed
                
                Image("logo_only") // Use the current image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100) // Adjust the size as needed
                    .offset(x: -10) // Move logo to the left by 10 points
                
                // Name input fields
                VStack(alignment: .leading, spacing: 12) {
                    InputField(label: "Name", placeholder: "Enter your name", text: $name)
                    InputField(label: "Username", placeholder: "Enter your username", text: $username)
                    InputField(label: "Email Address", placeholder: "Enter your email", text: $email)
                    InputField(label: "Password", placeholder: "Enter your password", text: $password, isSecure: true)
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 20)
                
                // Sign up button
                Button(action: {
                    signUp()
                }) {
                    Text("Sign Up")
                        .font(Font.custom("Rubik", size: 18).weight(.bold))
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 320, height: 48)
                        .background(Color(red: 0.93, green: 0.04, blue: 0.26))
                        .cornerRadius(32)
                        .padding(.bottom, 20) // Add spacing below the button
                }
                
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
        // .edgesIgnoringSafeArea(.all)
        //.navigationTitle("Sign Up") // Ensure navigation title is set
    }
    
    // Function to handle sign up action
    private func signUp() {
        print("Name: \(name)")
        print("Username: \(username)")
        print("Email: \(email)")
        print("Password: \(password)")
        
        // Add your sign-up logic here, such as sending the data to a server or validating the input
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
