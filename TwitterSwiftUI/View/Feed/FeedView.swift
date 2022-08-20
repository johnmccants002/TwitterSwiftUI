//
//  FeedView.swift
//  TwitterSwiftUI
//
//  Created by John McCants on 6/27/22.
//

import SwiftUI

struct FeedView: View {
    @State var isShowingNewTweetView = false
    @State var didTweet = false
    @ObservedObject var viewModel = FeedViewModel()
    
    func userDidTweet() {
        self.viewModel.fetchTweets()
        
        
    }
    
    
            
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack {

                    ForEach(viewModel.tweets) {
                        tweet in
                        NavigationLink(destination: TweetDetailView(tweet: tweet)) {
                            TweetCell(tweet: tweet)
                        }
                        
                            
                    }
                }.padding()
                
            }
            HStack {
            Spacer()
            Button(action: {isShowingNewTweetView.toggle()}, label: {
                Image(systemName: "plus")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding()
            })
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $isShowingNewTweetView) {
                NewTweetView(isPresented: $isShowingNewTweetView, feedViewModel: self.viewModel)
            }
     

        }
        }
        
    }
        
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}

extension Binding {
    
    /// When the `Binding`'s `wrappedValue` changes, the given closure is executed.
    /// - Parameter closure: Chunk of code to execute whenever the value changes.
    /// - Returns: New `Binding`.
    func onUpdate(_ closure: @escaping () -> Void) -> Binding<Value> {
        Binding(get: {
            wrappedValue
        }, set: { newValue in
            wrappedValue = newValue
            closure()
        })
    }
}
