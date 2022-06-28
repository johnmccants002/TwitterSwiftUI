//
//  FeedView.swift
//  TwitterSwiftUI
//
//  Created by John McCants on 6/27/22.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack  {
                    ForEach(0..<100) {
                        _ in
                        TweetCell()
                            
                    }
                }.padding()
                
            }
            Button(action: {}, label: {
                Image(systemName: "plus")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 32, height: 32)
                    .padding()
            })
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
        }
        
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
