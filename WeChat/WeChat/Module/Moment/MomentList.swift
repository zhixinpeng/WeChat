//
//  MomentList.swift
//  WeChat
//
//  Created by 彭智鑫 on 2021/5/24.
//

import SwiftUI
import Refresh

struct MomentList: View {
    @State private var moments: [Moment] = []
    @State private var footerRefreshing = false
    @State private var noMore = false
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                Header()
                    .anchorPreference(key: MomentHome.NavigationKey.self, value: .bottom) { [$0] }
                
                ForEach(moments) { moment in
                    VStack(spacing: 0) {
                        MomentRow(moment: moment)
                        Separator()
                    }
                }
            }
            .background(Color("cell"))
            
            RefreshFooter(refreshing: $footerRefreshing, action: loadMore) {
                Text(noMore ? "没有更多了" : "加载中...")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.secondary)
                    .padding(.top, 6)
                    .padding(.bottom, 20)
            }
            .preload(offset: 200)
            .noMore(noMore)
        }
        .enableRefresh()
        .onAppear(perform: load)
    }
    
    func load() {
        guard moments.isEmpty else {
            return
        }
        moments = Moment.page1
    }
    
    func loadMore() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.moments.append(contentsOf: Moment.page2)
            self.footerRefreshing = false
            self.noMore = true
        }
    }
    
    struct Header: View {
        let member: Member = .me
        
        var body: some View {
            ZStack(alignment: .bottomTrailing) {
                VStack {
                    Image(member.background ?? "")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 300)
                        .clipped()
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(height: 20)
                }
                
                HStack(spacing: 20) {
                    Text(member.name)
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))
                        .shadow(radius: 2)
                        .alignmentGuide(VerticalAlignment.center) { _ in 20 }
                    
                    Image(member.icon)
                        .resizable()
                        .cornerRadius(6)
                        .frame(width: 70, height: 70)
                        .padding(.trailing, 12)
                }
            }
        }
    }
}

struct MomentList_Previews: PreviewProvider {
    static var previews: some View {
        MomentList()
    }
}
