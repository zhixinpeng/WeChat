//
//  MeHome.swift
//  WeChat
//
//  Created by 彭智鑫 on 2021/5/17.
//

import SwiftUI

struct MeHome: View {
    var body: some View {
        ZStack {
            VStack {
                Color("cell")
                    .frame(height: 300)
                Color("light_gray")
            }
            
            MeList()
        }
    }
}

struct MeHome_Previews: PreviewProvider {
    static var previews: some View {
        MeHome()
    }
}
