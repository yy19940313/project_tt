//
//  SignUp.swift
//  project_tt
//
//  Created by Yi Y on 7/11/24.
//


import SwiftUI

struct SignInView: View {
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
                    
                    // Email and Password input fields
                    VStack(alignment: .leading, spacing: 12) {
                        // Email input field
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Email Address")
                                .font(Font.custom("Rubik", size: 14).weight(.light))
                                .foregroundColor(Color(red: 0, green: 0.15, blue: 0.29).opacity(0.60))
                            TextField("Enter your email", text: .constant("vivian_shi_1990@gmail.com"))
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
                            SecureField("Enter your password", text: .constant("************"))
                                .padding()
                                .background(Color.white)
                                .cornerRadius(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color(red: 0.90, green: 0.91, blue: 0.93), lineWidth: 0.50)
                                )
                        }
                    }
                    .padding(.horizontal, 30)
                    .padding(.bottom, 20)
                    
                    // Sign up button
                    Text("Sign In")
                        .font(Font.custom("Rubik", size: 18).weight(.bold))
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 320, height: 48)
                        .background(Color(red: 0.93, green: 0.04, blue: 0.26))
                        .cornerRadius(32)
                        .padding(.bottom, 20) // Add spacing below the button
                    
                    // "Already have an account? Log in here" text
                    
                    NavigationLink(destination: SignUpView()) {
                        Text("Don't have an account? ")
                            .font(Font.custom("Rubik", size: 14).weight(.light)) +
                        Text("Sign Up")
                            .font(Font.custom("Rubik", size: 16).weight(.heavy))
                            .foregroundColor(Color(red: 0.93, green: 0.04, blue: 0.26))// Increase font size and use heavier weight
                    }
                    .foregroundColor(Color(red: 0, green: 0.15, blue: 0.29))
                    .padding(.top, 10)
                    
                    Spacer()
                }
                .padding(.horizontal, 30) // Adjust padding as needed
                
            }
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
            //.navigationTitle("Sign In")
        }
    }



struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SignInView()
        }
    }
}
