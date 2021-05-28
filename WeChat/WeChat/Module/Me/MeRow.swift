//
//  MeRow.swift
//  WeChat
//
//  Created by 彭智鑫 on 2021/5/20.
//

import SwiftUI

struct MeRow: View {
    let icon: String
    let title: String
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image(icon)
                Text(title)
                    .font(.system(size: 16))
                Spacer()
                Image("cell_detail_indicator")
            }
            .padding()
        }
        .frame(height: 54)
    }
}

struct MeRow_Previews: PreviewProvider {
    static var previews: some View {
        MeRow(icon: "me_setting", title: "设置")
            .previewLayout(.sizeThatFits)
    }
}
