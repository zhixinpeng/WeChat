//
//  ChatHome.swift
//  WeChat
//
//  Created by 彭智鑫 on 2021/5/17.
//

import SwiftUI

struct ChatHome: View {
    var body: some View {
        ZStack {
            VStack {
                Color("light_gray").frame(height: 300)
                Spacer()
            }
            
            ChatList()
        }
    }
}

struct ChatHome_Previews: PreviewProvider {
    static var previews: some View {
        ChatHome()
    }
}
