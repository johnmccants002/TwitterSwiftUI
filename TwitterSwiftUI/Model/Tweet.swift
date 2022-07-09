//
//  Tweet.swift
//  TwitterSwiftUI
//
//  Created by John McCants on 7/7/22.
//

import Firebase

struct Tweet: Identifiable {
    let id: String
    let username: String
    let profileImageUrl: String
    let fullname: String
    let caption: String
    let likes: Int
    let uid: String
    let timestamp: Timestamp
    
    init(dict: [String: Any]) {
        self.id = dict["id"] as? String ?? ""
        self.username = dict["username"] as? String ?? ""
        self.profileImageUrl = dict["profileImageUrl"] as? String ?? ""
        self.fullname = dict["fullname"] as? String ?? ""
        self.likes = dict["likes"] as? Int ?? 0
        self.uid = dict["uid"] as? String ?? ""
        self.caption = dict["caption"] as? String ?? ""
        self.timestamp = dict["timestamp"] as? Timestamp ?? Timestamp(date: Date())
    }
}
