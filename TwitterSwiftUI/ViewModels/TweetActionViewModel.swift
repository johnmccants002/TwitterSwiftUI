//
//  TweetActionViewModel.swift
//  TwitterSwiftUI
//
//  Created by John McCants on 7/8/22.
//

import SwiftUI
import Firebase

class TweetActionViewModel: ObservableObject {
    let tweet: Tweet
    @Published var didLike = false
    
    init(tweet: Tweet) {
        self.tweet = tweet
        checkIfUserLikedTweet()
    }
    
    func likeTweet() {
        guard let uid = AuthViewModel.shared.userSession?.uid else {
            return
        }
        print("Pass like guard")
        let tweetLikesRef = COLLECTION_TWEETS.document(tweet.id).collection("tweet-likes")
        let userLikesRef = COLLECTION_USERS.document(uid).collection("user-likes")
        
        COLLECTION_TWEETS.document(tweet.id).updateData(["likes": tweet.likes + 1])
        
        tweetLikesRef.document(uid).setData([:]) { _ in
            userLikesRef.document(self.tweet.id).setData([:]) { _ in
                print("In completion")
                self.didLike = true
                
            }
        }
        
    }
    
    func unlikeTweet() {
        guard let uid = AuthViewModel.shared.userSession?.uid else {
            return
        }
        print("Pass unlike guard")
        let tweetLikesRef = COLLECTION_TWEETS.document(tweet.id).collection("tweet-likes")
        let userLikesRef = COLLECTION_USERS.document(uid).collection("user-likes")
        
        COLLECTION_TWEETS.document(tweet.id).updateData(["likes": tweet.likes - 1])

        tweetLikesRef.document(uid).delete { _ in
            userLikesRef.document(self.tweet.id).delete { _ in
                print("in completion")
                self.didLike = false
                
            }
        }

        
    }
    
    func checkIfUserLikedTweet() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        let userLikesRef = COLLECTION_USERS.document(uid).collection("user-likes").document(tweet.id)
        
        userLikesRef.getDocument { snapshot, _ in
            guard let didLike = snapshot?.exists else { return }
            self.didLike = didLike
        }
        
    }
}
