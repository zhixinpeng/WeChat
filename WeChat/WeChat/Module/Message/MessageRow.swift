//
//  MessageRow.swift
//  WeChat
//
//  Created by 彭智鑫 on 2021/5/20.
//

import SwiftUI

struct MessageRow: View {
    let message: Message
    let isMe: Bool
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            if isMe {
                Spacer()
            } else {
                Avatar(icon: message.member.icon)
            }
            
            if message.type == .text {
                TextMessage(isMe: isMe, text: message.text ?? "")
            }
            
            if isMe {
                Avatar(icon: message.member.icon)
            } else {
                Spacer()
            }
        }
        .padding(.init(top: 8, leading: 12, bottom: 8, trailing: 12))
    }
}

struct MessageRow_Previews: PreviewProvider {
    static var previews: some View {
        MessageRow(message: Message.all[0], isMe: false)
            .previewLayout(.sizeThatFits)
    }
}
