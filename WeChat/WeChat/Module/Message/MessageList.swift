//
//  MessageList.swift
//  WeChat
//
//  Created by 彭智鑫 on 2021/5/20.
//

import SwiftUI

struct MessageList: View {
    @State private var messages: [Message] = []
    
    var body: some View {
        ScrollView {
            ScrollViewReader { proxy in
                LazyVStack(spacing: 0) {
                    ForEach(messages) { message in
                        if let createdAt = message.createdAt {
                            TimeView(date: createdAt.date)
                        }
                        MessageRow(message: message, isMe: message.member.identifier == Member.me.identifier)
                            .id(message.id)
                    }
                }
                .background(Color("light_gray"))
                .onChange(of: messages) { message in
                    if let lastId = messages.last?.id {
                        proxy.scrollTo(lastId)
                    }
                }
            }
        }
        .onAppear(perform: load)
    }
    
    func load() {
        guard messages.isEmpty else {
            return
        }
        messages = Message.all
    }
    
    struct TimeView: View {
        let date: Date
        
        var body: some View {
            Text(date.formatString)
                .foregroundColor(Color("chat_time"))
                .font(.system(size: 14, weight: .medium))
                .frame(maxWidth: .infinity)
                .padding(.vertical, 4)
        }
    }
}

struct MessageList_Previews: PreviewProvider {
    static var previews: some View {
        MessageList()
    }
}
