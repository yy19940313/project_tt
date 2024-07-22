//
//  Supabase.swift
//  project_tt
//
//  Created by Yi Y on 7/17/24.
//

import Supabase
import Foundation

let supabase = SupabaseClient(
    supabaseURL: URL(string: "https://udyhuznktvwsmruwslgc.supabase.co")!,
    supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVkeWh1em5rdHZ3c21ydXdzbGdjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjEyNjc2ODIsImV4cCI6MjAzNjg0MzY4Mn0.sWLK4tVBXG16tJ0SmEmTsrd0nfzKrDjRfFxG0U8mRuU"
)


class SupabaseManager {
    static let shared = SupabaseManager()
    let client: SupabaseClient

    private init() {
        let supabaseURL = URL(string: "https://udyhuznktvwsmruwslgc.supabase.co")!
        let supabaseKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVkeWh1em5rdHZ3c21ydXdzbGdjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjEyNjc2ODIsImV4cCI6MjAzNjg0MzY4Mn0.sWLK4tVBXG16tJ0SmEmTsrd0nfzKrDjRfFxG0U8mRuU"
        client = SupabaseClient(supabaseURL: supabaseURL, supabaseKey: supabaseKey)
    }
}
