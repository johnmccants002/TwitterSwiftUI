//
//  ProfileActionButtonView.swift
//  TwitterSwiftUI
//
//  Created by John McCants on 6/28/22.
//

import SwiftUI

struct ProfileActionButtonView: View {
    let isCurrentUser: Bool
    @ObservedObject var viewModel: ProfileViewModel
    
    
    var body: some View {
        if isCurrentUser {
            Button(action: {}, label: {
                Text("Edit Profile")
                    .frame(width: 360, height: 40)
                    .background(Color.blue)
                    .foregroundColor(.white)
            })
            .cornerRadius(20)
        } else {
            HStack {
                Button(action: {
                    viewModel.user.isFollowed ? viewModel.unfollow() : viewModel.follow()
                }, label: {
                    Text(viewModel.user.isFollowed ? "Following" : "Follow")
                        .frame(width: 180, height: 40)
                        .background(Color.blue)
                        .foregroundColor(.white)
                })
                .cornerRadius(20)
                
                NavigationLink(destination: ChatView(), label: {
                        Text("Message")
                            .frame(width: 180, height: 40)
                            .background(Color.purple)
                            .foregroundColor(.white)
             
                    
                })
                .cornerRadius(20)

            }
        }
    }
}


