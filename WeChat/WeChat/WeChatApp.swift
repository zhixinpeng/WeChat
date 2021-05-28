//
//  WeChatApp.swift
//  WeChat
//
//  Created by 彭智鑫 on 2021/5/17.
//

import SwiftUI

@main
struct WeChatApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
                .onAppear(perform: setupApperance)
                .onAppear(perform: setupStatusBarStyle)
        }
    }
    
    func setupApperance() {
        let backImage = UIImage(named: "back")?
            .withPadding(.init(top: -2, left: 0, bottom: 0, right: -4))
        
        UINavigationBar.appearance().backIndicatorImage = backImage
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = backImage
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().tintColor = UIColor(named: "navigation_tint")
        UINavigationBar.appearance().barTintColor = UIColor(named: "navigation_bar_tint")
    }
    
    func setupStatusBarStyle() {
        guard let window = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first,
              let statusBarManager = window.windowScene?.statusBarManager else {
            return
        }
        
        StatusBarStyle.Key.defaultValue.getter = {
            statusBarManager.statusBarStyle
        }
        
        StatusBarStyle.Key.defaultValue.setter = {
            UIApplication.shared.statusBarStyle = $0
        }
    }
}
