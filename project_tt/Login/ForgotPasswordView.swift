//
//  ForgotPasswordView.swift
//  project_tt
//
//  Created by Yi Y on 7/17/24.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State private var email: String = ""
    
    var body: some View {

        ZStack{
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack {
                

                
                Text("Forgot Password")
                    .font(Font.custom("Rubik", size: 24).weight(.bold))
                    .padding(.bottom, 20)
                
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
                .padding(.horizontal, 30)
                .padding(.bottom, 20)
                
                // Reset Password button
                Button(action: {
                    // Add your reset password logic here
                    print("Reset password for email: \(email)")
                }) {
                    Text("Reset Password")
                        .font(Font.custom("Rubik", size: 18).weight(.bold))
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 320, height: 48)
                        .background(Color(red: 0.93, green: 0.04, blue: 0.26))
                        .cornerRadius(32)
                }
                .padding(.top, 20)
                
                Spacer()
            }
            .padding(.horizontal, 30)
            .padding(.top, 100)
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
