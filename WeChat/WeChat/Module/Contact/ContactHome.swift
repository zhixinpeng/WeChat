//
//  ContactHome.swift
//  WeChat
//
//  Created by 彭智鑫 on 2021/5/17.
//

import SwiftUI

struct ContactHome: View {
    var body: some View {
        ZStack {
            VStack {
                Color("light_gray")
                    .frame(height: 300)
                Spacer()
            }
            ContactList()
        }
    }
}

struct ContactHome_Previews: PreviewProvider {
    static var previews: some View {
        ContactHome()
    }
}
