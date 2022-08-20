//
//  NewTweetView.swift
//  TwitterSwiftUI
//
//  Created by John McCants on 6/28/22.
//

import SwiftUI
import Kingfisher

struct NewTweetView: View {
    @Binding var isPresented: Bool
    @State var captionText: String = ""
    @ObservedObject var viewModel: UploadTweetViewModel
    @ObservedObject var feedViewModel: FeedViewModel
    
    init(isPresented: Binding<Bool>, feedViewModel: FeedViewModel) {
        self._isPresented = isPresented
        self.feedViewModel = feedViewModel
        self.viewModel = UploadTweetViewModel(isPresented: isPresented)
    }
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .top) {
                    if let user = AuthViewModel.shared.user {
                        KFImage(URL(string: user.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .frame(width: 64, height: 64)
                            .cornerRadius(32)
                    }
                    
                    TextArea("What's happening?", text: $captionText)
                    
                    Spacer()
                    
                }
                .padding()
                .navigationBarItems(leading: Button(action: {isPresented.toggle()}, label: {
                    Text("Cancel")
                        .foregroundColor(.blue)
                }),
                                    trailing: Button(action: {
                    viewModel.uploadTweet(caption: captionText) { _ in
                        self.feedViewModel.fetchTweets()
                        isPresented.toggle()
                        
                    }
                }, label: {
                    Text("Tweet")
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
            }))
                Spacer()
            }
            
        }
    }
}


