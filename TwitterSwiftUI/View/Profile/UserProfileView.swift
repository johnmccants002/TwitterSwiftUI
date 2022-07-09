//
//  UserProfileView.swift
//  TwitterSwiftUI
//
//  Created by John McCants on 6/28/22.
//

import SwiftUI

struct UserProfileView: View {
    let user: User
    @State var selectedFilter: TweetFilterOptions = .tweets
    @ObservedObject var viewModel: ProfileViewModel
    
    init(user: User) {
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
    }
    var body: some View {
        ScrollView {
            VStack {
                ProfileHeaderView(user: user, viewModel: viewModel)
                    .padding()
                FilterButtonView(selectedOption: $selectedFilter)
                
                ForEach(viewModel.tweets(forFilter: selectedFilter)) { tweet in
                    TweetCell(tweet: tweet)
                        .padding()
                }
                
            }
            .navigationTitle(user.username)
        }
    }
}


