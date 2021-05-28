//
//  ChatView.swift
//  WeChat
//
//  Created by 彭智鑫 on 2021/5/20.
//

import SwiftUI

struct ChatView: View {
    let chat: Chat
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                Separator(color: Color("navigation_separator"))
                MessageList()
                Send(geometry: geometry)
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .background(Color("light_gray"))
        .navigationBarTitle(chat.sender.name, displayMode: .inline)
    }
    
    struct Send: View {
        let geometry: GeometryProxy
        
        @State private var text: String = ""
        
        var body: some View {
            VStack(spacing: 0) {
                Separator(color: Color("chat_send_line"))
                
                ZStack {
                    Color("chat_send_background")
                    
                    VStack {
                        HStack(spacing: 12) {
                            Image("chat_send_voice")
                            
                            TextEditor(text: $text)
                                .frame(height: 40)
                                .background(Color("chat_send_text_background"))
                                .cornerRadius(4)
                            
                            Image("chat_send_emoji")
                            Image("chat_send_more")
                        }
                        .frame(height: 56)
                        .padding(.horizontal, 12)
                        
                        Spacer()
                    }
                }
                .frame(height: geometry.safeAreaInsets.bottom + 56)
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView { ChatView(chat: .swiftui) }
    }
}
