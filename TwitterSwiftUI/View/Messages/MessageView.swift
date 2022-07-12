//
//  MessageView.swift
//  TwitterSwiftUI
//
//  Created by John McCants on 6/28/22.
//

import SwiftUI
import Kingfisher

struct MessageView: View {
    let message: Message
    var body: some View {
        HStack {
            if message.isFromCurrentUser {
                Spacer()
                Text(message.text)
                    .padding()
                    .background(Color.blue)
                    .clipShape(ChatBubble(isFromCurrentUser: true))
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.leading, 100)
                    .padding(.trailing, 16)
            } else {
                HStack(alignment: .bottom) {
                    KFImage(URL(string: message.user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                    
                    Text(message.text)
                        .padding()
                        .background(.gray)
                        .clipShape(ChatBubble(isFromCurrentUser: false))
                        .foregroundColor(.white)
                        
                    
                }
                .padding(.horizontal)
                .padding(.leading, 16)
                .padding(.trailing, 100)
                Spacer()
            }
        }
    }
}


