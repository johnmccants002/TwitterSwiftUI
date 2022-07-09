//
//  UploadTweetViewModel.swift
//  TwitterSwiftUI
//
//  Created by John McCants on 7/7/22.
//

import Firebase
import SwiftUI

class UploadTweetViewModel: ObservableObject {
    @Binding var isPresented: Bool
    
    init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
    }
    
    func uploadTweet(caption: String, completion: @escaping((Error?) -> Void)) {
        guard let user = AuthViewModel.shared.user else { return }
        
        let docRef = COLLECTION_TWEETS.document()
        
        let data: [String: Any] = [
            "uid": user.id,
            "caption": caption,
            "fullname": user.fullname,
            "timestamp": Timestamp(date: Date()),
            "username": user.username,
            "profileImageUrl": user.profileImageUrl,
            "likes": 0,
            "id": docRef.documentID
        ]
        
        docRef.setData(data, completion: completion)
        
    }
    
}
