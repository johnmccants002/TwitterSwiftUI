//
//  ConversationsViewModel.swift
//  TwitterSwiftUI
//
//  Created by John McCants on 7/9/22.
//

import Foundation
import Firebase

class ConversationViewModel: ObservableObject {
    @Published var recentMessages = [Message]()
    private var recentMessagesDict = [String: Message]()
    
    init() {
        fetchRecentMessages()
    }
    
    func fetchRecentMessages() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        let query = COLLECTION_MESSAGES.document(uid).collection("recent-messages")
        query.order(by: "timestamp", descending: true)
        
        query.addSnapshotListener { snapshot, error in
            guard let changes = snapshot?.documentChanges else { return }
            
            changes.forEach { change in
                let messageData = change.document.data()
                let uid = change.document.documentID
                
                COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
                    guard let data = snapshot?.data() else { return }
                    let user = User(dict: data)
                    
                    self.recentMessagesDict[uid] = Message(user: user, dict: messageData)
                    
                    self.recentMessages = Array(self.recentMessagesDict.values)
                }
                
            }
        }
    }
}
