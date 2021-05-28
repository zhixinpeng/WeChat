//
//  Avatar.swift
//  WeChat
//
//  Created by 彭智鑫 on 2021/5/20.
//

import SwiftUI

struct Avatar: View {
    let icon: String
    
    var body: some View {
        Image(icon)
            .resizable()
            .frame(width: 40, height: 40)
    }
}

struct Avatar_Previews: PreviewProvider {
    static var previews: some View {
        Avatar(icon: Member.foodie.icon)
            .previewLayout(.sizeThatFits)
    }
}
