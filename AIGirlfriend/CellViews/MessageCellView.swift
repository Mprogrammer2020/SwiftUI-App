//
//  MessageCellView.swift
//  AIGirlfriend
//
//  Created by Netset on 10/07/24.
//

import SwiftUI

struct MessageCellView: View {
    
    var currentMessage: Message
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 10) {
            if !currentMessage.isCurrentUser {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .center)
                    .cornerRadius(20)
            } else {
                Spacer()
            }
            MessageCell(contentMessage: currentMessage.content,
                        isCurrentUser: currentMessage.isCurrentUser)
        }
        .frame(maxWidth: .infinity, alignment: currentMessage.isCurrentUser ? .trailing : .leading)
        .padding()
    }
}

struct MessageCell: View {
    var contentMessage: String
    var isCurrentUser: Bool
    
    var body: some View {
        Text(contentMessage)
            .padding(10)
            .foregroundColor(isCurrentUser ? (Color.white) : Color.white)
            .background(isCurrentUser ? Color(hex: 0xE9194B) : Color(hex: 0xF0104,opacity: 0.3))
            .cornerRadius(10)
    }
}

#Preview {
    MessageCellView(currentMessage: Message(content: "This is a single message cell with avatar. If user is current user, we won't display the avatar.", isCurrentUser: false))
}
