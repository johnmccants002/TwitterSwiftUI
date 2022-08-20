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
    @State var user: User?
    @ObservedObject var viewModel = ConversationViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            if let user = user {
                NavigationLink(destination: LazyView(ChatView(user: user)), isActive: $showChat, label: {} )
                            }
            
            ScrollView {
                VStack {
                    ForEach(viewModel.recentMessages) {
                        message in
                
                        NavigationLink ( destination:
                            LazyView(ChatView(user: message.user)),
                         label: {
                            ConversationCell(message: message)
                                
                        })
                    }
                }.padding()
            }
            HStack {
                Spacer()
                Button(action: {
                    print("isShowingNewMessageView: \(isShowingingNewMessageView)")
                    self.isShowingingNewMessageView = true
                    
                }, label: {
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
                .sheet(isPresented: $isShowingingNewMessageView, content: {
                    NewMessageView(show: $isShowingingNewMessageView, startChat: $showChat, user: $user)
   
            })
            }
        }
 
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
