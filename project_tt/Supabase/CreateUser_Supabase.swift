//
//  CreateUser_Supabase.swift
//  project_tt
//
//  Created by Yi Y on 7/18/24.
//
/*
import SwiftUI
import Supabase

struct SignUpView_Supabase: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String?
    @State private var isLoading: Bool = false
    @State private var isSignedUp: Bool = false

    var body: some View {
        VStack {
            if isSignedUp {
                Text("Sign Up Successful! Please check your email to confirm your account.")
            } else {
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }

                if isLoading {
                    ProgressView()
                        .padding()
                } else {
                    Button(action: signUp) {
                        Text("Sign Up")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .padding()
                }
            }
        }
        .padding()
    }

    private func signUp() {
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Please enter both email and password."
            return
        }

        isLoading = true
        errorMessage = nil

        SupabaseManager.shared.client.auth.signUp(email: email, password: password) { result in
            isLoading = false

            switch result {
            case .success(let response):
                print("User signed up: \(response)")
                isSignedUp = true
            case .failure(let error):
                errorMessage = "Sign Up Failed: \(error.localizedDescription)"
            }
        }
    }
}

#Preview {
    SignUpView_Supabase()
}
*/
