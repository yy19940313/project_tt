//
//  AppView_Supabase.swift
//  project_tt
//
//  Created by Yi Y on 7/18/24.
//

import SwiftUI
import Supabase


struct AppView_Supabase: View {
  @State var isAuthenticated = false

  var body: some View {
    Group {
      if isAuthenticated {
        ProfileView_Supabase()
      } else {
        AuthView_Supabase()
      }
    }
    .task {
      for await state in supabase.auth.authStateChanges {
        if [.initialSession, .signedIn, .signedOut].contains(state.event) {
          isAuthenticated = state.session != nil
        }
      }
    }
  }
}

#Preview {
    AppView_Supabase()
}
