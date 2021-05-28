//
//  TextMessage.swift
//  WeChat
//
//  Created by 彭智鑫 on 2021/5/20.
//

import SwiftUI

struct TextMessage: View {
    let isMe: Bool
    let text: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            if !isMe {
                Arrow(isMe: isMe)
            }
            Text(text)
                .font(.system(size: 17))
                .padding(.horizontal, 12)
                .padding(.vertical, 10)
                .background(RoundedRectangle(cornerRadius: 4).foregroundColor(Color("chat_\(isMe ? "me" : "friend")_background")))
            if isMe {
                Arrow(isMe: isMe)
            }
        }
    }
    
    struct Arrow: View {
        let isMe: Bool
        
        var body: some View {
            Path { path in
                path.move(to: .init(x: isMe ? 0 : 6, y: 14))
                path.addLine(to: .init(x: isMe ? 0 : 6, y: 26))
                path.addLine(to: .init(x: isMe ? 6 : 0, y: 20))
                path.addLine(to: .init(x: isMe ? 0 : 6, y: 14))
            }
            .fill(Color("chat_\(isMe ? "me" : "friend")_background"))
            .frame(width: 6, height: 30)
        }
    }
}

struct TextMessage_Previews: PreviewProvider {
    static var previews: some View {
        TextMessage(isMe: false, text: "Hello World")
            .previewLayout(.sizeThatFits)
    }
}
