//
//  ContentView_Supabase.swift
//  project_tt
//
//  Created by Yi Y on 7/17/24.
//

import SwiftUI
import Supabase

struct ContentView_Supabase: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoading = false
    @State private var errorMessage: String?

    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
                .padding()

            SecureField("Password", text: $password)
                .padding()

            if let errorMessage = errorMessage {
                Text(errorMessage).foregroundColor(.red)
            }

            Button(action: signIn) {
                Text("Sign In")
            }.padding()

            Button(action: signUp) {
                Text("Sign Up")
            }.padding()

            if isLoading {
                ProgressView()
            }
        }
        .padding()
    }

    func signIn() {
        Task {
            isLoading = true
            defer { isLoading = false }
            do {
                let session = try await supabase.auth.signIn(email: email, password: password)
                print("Signed in as \(session.user.email ?? "Unknown")")
            } catch {
                errorMessage = error.localizedDescription
            }
        }
    }

    func signUp() {
        Task {
            isLoading = true
            defer { isLoading = false }
            do {
                let session = try await supabase.auth.signUp(email: email, password: password)
                print("Signed up as \(session.user.email ?? "Unknown")")
            } catch {
                errorMessage = error.localizedDescription
            }
        }
    }
}

#Preview {
    ContentView_Supabase()
}
