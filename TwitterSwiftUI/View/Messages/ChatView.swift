//
//  ChatView.swift
//  TwitterSwiftUI
//
//  Created by John McCants on 6/28/22.
//

import SwiftUI

struct ChatView: View {
    let user: User
    @ObservedObject var viewModel: ChatViewModel
    @State var messageText = ""
    
    init(user: User) {
        self.user = user
        self.viewModel = ChatViewModel(user: user)
    }
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(viewModel.messages) { message in
                        MessageView(message: message)
                    }
                }
            }.padding(.top)
                
            MessageInputView(messageText: $messageText, action: sendMessage)
                .padding()
               
        }
        .navigationTitle(user.username)
//        .navigationBarItems(leading: Button(action : {
//            showChat.toggle()
//            
//        }){
//            Image(systemName: "arrow.left")
//        })
            
    }
    
    func sendMessage() {
        viewModel.sendMessage(messageText)
        messageText = ""
        
    }
}



