//
//  ConversationsView.swift
//  TwitterSwiftUI
//
//  Created by John McCants on 6/28/22.
//

import SwiftUI

struct ConversationsView: View {
    @State var isShowingingNewMessageView = false
    @State var showChat = false
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            NavigationLink(destination: ChatView(), isActive: $showChat, label: {} )
            ScrollView {
                VStack {
                    ForEach(0..<20) {
                        _ in
                        NavigationLink {
                            ChatView()
                        } label: {
                            ConversationCell()
                        }
                    }
                }.padding()
            }
            Button(action: {self.isShowingingNewMessageView.toggle()}, label: {
                Image(systemName: "envelope")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding()
            })
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .sheet(isPresented: $isShowingingNewMessageView) {
                NewMessageView(show: $isShowingingNewMessageView, startChat: $showChat)
      
            }
        }
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
