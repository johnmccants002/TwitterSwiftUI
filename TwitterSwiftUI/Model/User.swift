//
//  User.swift
//  TwitterSwiftUI
//
//  Created by John McCants on 7/4/22.
//

import Foundation
import Firebase

struct User: Identifiable {
    let id, username, profileImageUrl, fullname, email: String
    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == self.id }
    
    init(dict: [String: Any]) {
        self.id = dict["uid"] as? String ?? ""
        self.username = dict["username"] as? String ?? ""
        self.profileImageUrl = dict["profileImageUrl"] as? String ?? ""
        self.fullname = dict["fullname"] as? String ?? ""
        self.email = dict["email"] as? String ?? ""
        
        
    }
    
}
