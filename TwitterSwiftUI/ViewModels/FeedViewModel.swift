//
//  TweetViewModel.swift
//  TwitterSwiftUI
//
//  Created by John McCants on 7/7/22.
//

import SwiftUI

class FeedViewModel: ObservableObject {
    @Published var tweets = [Tweet]()
    
    init() {
        fetchTweets()
    }
    
    func fetchTweets() {
        COLLECTION_TWEETS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.tweets = documents.map({ Tweet(dict: $0.data()) })
        }
    }
}
