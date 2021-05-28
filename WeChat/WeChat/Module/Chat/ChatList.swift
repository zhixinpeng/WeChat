//
//  ChatList.swift
//  WeChat
//
//  Created by 彭智鑫 on 2021/5/20.
//

import SwiftUI

struct ChatList: View {
    @State private var chats: [Chat] = []
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                SearchEntry()
                
                ForEach(chats) { chat in
                    NavigationLink(destination: ChatView(chat: chat)) {
                        ChatRow(chat: chat)
                    }
                    Separator()
                        .padding(.leading, 76)
                }
            }
            .background(Color("cell"))
        }
        .onAppear(perform: load)
    }
    
    func load() {
        guard chats.isEmpty else {
            return
        }
        chats = Chat.all
    }
}

struct ChatList_Previews: PreviewProvider {
    static var previews: some View {
        ChatList()
    }
}
