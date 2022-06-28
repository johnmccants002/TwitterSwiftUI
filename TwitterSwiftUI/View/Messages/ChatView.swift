//
//  ChatView.swift
//  TwitterSwiftUI
//
//  Created by John McCants on 6/28/22.
//

import SwiftUI

struct ChatView: View {
    @State var messageText = ""
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(0..<20) { _ in
                        HStack {
                            Spacer()
                            Text("Test")
                                .padding()
                                .background(Color.blue)
                            .clipShape(ChatBubble(isFromCurrentUser: true))
                            .foregroundColor(.white)
                            .padding(.horizontal)
                        }
                        
                    }
                }
            }
            MessageInputView(messageText: $messageText)
                .padding()
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
