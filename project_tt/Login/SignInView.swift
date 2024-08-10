//
//  SignUp.swift
//  project_tt
//
//  Created by Yi Y on 7/11/24.
//

import SwiftUI

struct SignInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showSignUp: Bool = false
    @State private var showHome: Bool = false // For navigation after successful login
    @State private var showForgotPassword: Bool = false // For navigation to forgot password view
    
    var body: some View {
        NavigationView {
            ZStack {
                
                // Background Color
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer() // Adjust spacing as needed
                    
                    Text("Welcome Back to Sip")
                        .font(Font.custom("Rubik", size: 24).weight(.bold))
                        .padding(.bottom, 20)
                    
                    // Email and Password input fields
                    VStack(alignment: .leading, spacing: 12) {
                        // Email input field
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Email Address")
                                .font(Font.custom("Rubik", size: 14).weight(.light))
                                .foregroundColor(Color(red: 0, green: 0.15, blue: 0.29).opacity(0.60))
                            TextField("Enter your email", text: $email)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color(red: 0.90, green: 0.91, blue: 0.93), lineWidth: 0.50)
                                )
                        }
                        
                        // Password input field
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Password")
                                .font(Font.custom("Rubik", size: 14).weight(.light))
                                .foregroundColor(Color(red: 0, green: 0.15, blue: 0.29).opacity(0.60))
                            SecureField("Enter your password", text: $password)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color(red: 0.90, green: 0.91, blue: 0.93), lineWidth: 0.50)
                                )
                                .padding(.bottom, 5)
                            // "Forgot Password?" link
                            HStack {
                                NavigationLink(destination: ForgotPasswordView(), isActive: $showForgotPassword) {
                                    Text("Forgot Password?")
                                        .font(Font.custom("Rubik", size: 14).weight(.light))
                                        .foregroundColor(Color.blue)
                                }
                                .padding(.horizontal, 5)
                                Spacer() // Pushes the link to the left
                            }
                        }
                    }
                    .padding(.horizontal, 30)
                    .padding(.bottom, 20)
                    

                    
                    // Sign in button
                    Button(action: {
                        signIn()
                    }) {
                        Text("Sign In")
                            .font(Font.custom("Rubik", size: 18).weight(.bold))
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 320, height: 48)
                            .background(Color(red: 0.93, green: 0.04, blue: 0.26))
                            .cornerRadius(32)
                    }
                    .padding(.bottom, 20) // Add spacing below the button
                
                    
                    // "Don't have an account? Sign Up" text
                    NavigationLink(destination: SignUpView(), isActive: $showSignUp) {
                        HStack {
                            Text("Don't have an account? ")
                                .font(Font.custom("Rubik", size: 14).weight(.light))
                                .foregroundColor(Color(red: 0, green: 0.15, blue: 0.29))
                            
                            Text("Sign Up")
                                .font(Font.custom("Rubik", size: 16).weight(.heavy))
                                .foregroundColor(Color(red: 0.93, green: 0.04, blue: 0.26)) // Increase font size and use heavier weight
                        }
                    }
                    .padding(.top, 10)
                    
                    Spacer()
                }
                .padding(.horizontal, 30) // Adjust padding as needed
                
            }
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
        }
    }
    
    func signIn() {
        // Placeholder for sign-in logic
        // Implement your authentication logic here, e.g., call to a backend server
        print("Email: \(email)")
        print("Password: \(password)")
        
        // Simulate successful sign-in
        if email == "test@example.com" && password == "password" {
            showHome = true
        } else {
            // Handle sign-in error
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
