//
//  Message.swift
//  TwitterSwiftUI
//
//  Created by John McCants on 6/28/22.
//

import Foundation

struct MockMessage: Identifiable {
    let id: Int
    let imageName: String
    let messageText: String
    let isCurrentUser: Bool
}

let MOCK_MESSAGES: [MockMessage] = [.init(id: 0, imageName: "spiderman", messageText: "Hey whats up?", isCurrentUser: false), .init(id: 1, imageName: "batman", messageText: "Nothing much just chilling you?", isCurrentUser: true)]
