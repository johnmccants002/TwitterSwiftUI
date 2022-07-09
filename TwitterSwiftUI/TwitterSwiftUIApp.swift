//
//  TwitterSwiftUIApp.swift
//  TwitterSwiftUI
//
//  Created by John McCants on 6/27/22.
//

import SwiftUI
import Firebase

@main
struct TwitterSwiftUIApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}
