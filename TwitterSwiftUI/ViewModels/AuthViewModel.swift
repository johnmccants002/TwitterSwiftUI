//
//  AuthViewModel.swift
//  TwitterSwiftUI
//
//  Created by John McCants on 7/2/22.
//

import SwiftUI
import Firebase
import FirebaseStorage
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var isAuthenticating = false
    @Published var error: Error?
    @Published var user: User?
    
    static let shared = AuthViewModel()
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) {
            result, error in
            if let error = error {
                print("Failed to login: \(error.localizedDescription)")
                return
            }
            print("DEBUG: Successfully logged in")
            self.userSession = result?.user
            self.fetchUser()
            
        }
        
    }
    
    func registerUser(email: String, password: String, username: String, fullname: String, profileImage: UIImage) {
        
        guard let imageData = profileImage.jpegData(compressionQuality: 0.3) else { return }
        let filename = NSUUID().uuidString
        let storageRef = Storage.storage().reference().child(filename)
        storageRef.putData(imageData, metadata: nil) { _, error in
            
            if let error = error {
                print("DEBUG: Error \(error.localizedDescription)")
                return
            }
            
            storageRef.downloadURL { url, _ in
                guard let profileImageUrl = url?.absoluteString else { return }
                
                Auth.auth().createUser(withEmail: email, password: password) {
                    result, error in
                    if let error = error {
                        print("DEBUG: Error \(error.localizedDescription)")
                        return
                    }
                    
                    guard let user = result?.user else { return }
                    
                    let data = [
                        "email": email,
                        "fullname": fullname,
                        "username": username,
                        "profileImageUrl": profileImageUrl,
                        "uid": user.uid
                    ]
                    
                    Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                        print("DEBUG: Successfully uploaded user data")
                        self.userSession = user
                        self.fetchUser()
                    }


                }
            }
        }

    }
    
    func signout() {
        self.userSession = nil
        user = nil
        try? Auth.auth().signOut()
        
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, _ in
            guard let data = snapshot?.data() else { return }
            self.user = User(dict: data)
         
            
            
        }
    }
}
