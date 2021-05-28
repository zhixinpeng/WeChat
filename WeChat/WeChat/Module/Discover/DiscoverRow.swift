//
//  DiscoverRow.swift
//  WeChat
//
//  Created by 彭智鑫 on 2021/5/24.
//

import SwiftUI

struct DiscoverRow: View {
    let icon: String
    let title: String
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 12) {
                Image(icon)
                    .renderingMode(.original)
                Text(title)
                    .font(.system(size: 16))
                    .foregroundColor(.primary)
                Spacer()
                Image("cell_detail_indicator")
                    .renderingMode(.original)
            }
            .padding()
        }
        .frame(height: 54)
    }
}

struct DiscoverRow_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverRow(icon: "discover_moment", title: "朋友圈")
            .previewLayout(.sizeThatFits)
    }
}
