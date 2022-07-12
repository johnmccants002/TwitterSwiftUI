//
//  Message.swift
//  TwitterSwiftUI
//
//  Created by John McCants on 6/28/22.
//

import Foundation
import Firebase

struct MockMessage: Identifiable {
    let id: Int
    let imageName: String
    let messageText: String
    let isCurrentUser: Bool
}

let MOCK_MESSAGES: [MockMessage] = [.init(id: 0, imageName: "spiderman", messageText: "Hey whats up?", isCurrentUser: false), .init(id: 1, imageName: "batman", messageText: "Nothing much just chilling you?", isCurrentUser: true)]


struct Message: Identifiable {
    let text, toId, fromId, id: String
    let user: User
    let timestamp: Timestamp
    let isFromCurrentUser: Bool
    
    var chartPartnerId: String { return isFromCurrentUser ? toId : fromId }
    
    init(user: User, dict: [String: Any]) {
        self.user = user
        
        self.text = dict["text"] as? String ?? ""
        self.toId = dict["toId"] as? String ?? ""
        self.fromId = dict["fromId"] as? String ?? ""
        self.id = dict["id"] as? String ?? ""
        self.isFromCurrentUser = fromId == AuthViewModel.shared.userSession?.uid
        self.timestamp = dict["timestamp"] as? Timestamp ?? Timestamp(date: Date())
        
        
    }
}
