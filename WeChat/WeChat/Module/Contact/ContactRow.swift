//
//  ContactRow.swift
//  WeChat
//
//  Created by 彭智鑫 on 2021/5/20.
//

import SwiftUI

struct ContactRow: View {
    let icon: String
    let title: String
    let style: Style
    
    var body: some View {
        HStack {
            Image(icon)
                .renderingMode(.original)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(style == .system ? 4 : 6)
            
            Text(title)
                .font(.system(size: 16))
                .foregroundColor(.primary)
        }
        .padding(EdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 16))
    }
    
    enum Style {
        case system
        case member
    }
}

struct ContactRow_Previews: PreviewProvider {
    static var previews: some View {
        ContactRow(icon: "contact_new_friend", title: "新的朋友", style: .system)
            .previewLayout(.sizeThatFits)
    }
}
