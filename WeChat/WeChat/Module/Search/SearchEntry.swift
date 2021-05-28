//
//  SearchEntry.swift
//  WeChat
//
//  Created by 彭智鑫 on 2021/5/20.
//

import SwiftUI

struct SearchEntry: View {
    @State private var isSearchPresented: Bool = false
    
    var body: some View {
        Button(action: { isSearchPresented.toggle() }) {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 13, height: 13)
                        .foregroundColor(.secondary)
                    
                    Text("搜索")
                        .font(.system(size: 16))
                        .foregroundColor(.secondary)
                    Spacer()
                }
                Spacer()
            }
            .background(Color("search_corner_background"))
            .cornerRadius(6)
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
        }
        .background(Color("light_gray"))
        .sheet(isPresented: $isSearchPresented) {
            SearchHome()
        }
    }
}

struct SearchEntry_Previews: PreviewProvider {
    static var previews: some View {
        SearchEntry()
    }
}
