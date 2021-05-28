//
//  StatusBarStyleEnvironment.swift
//  WeChat
//
//  Created by 彭智鑫 on 2021/5/24.
//

import SwiftUI

class StatusBarStyle {
    var getter: () -> UIStatusBarStyle = { .default }
    var setter: (UIStatusBarStyle) -> Void = { _ in }
    
    var current: UIStatusBarStyle {
        get { self.getter() }
        set { self.setter(newValue) }
    }
}

extension StatusBarStyle {
    struct Key: EnvironmentKey {
        static var defaultValue: StatusBarStyle = StatusBarStyle()
    }
}

extension EnvironmentValues {
    var statusBarStyle: StatusBarStyle {
        self[StatusBarStyle.Key.self]
    }
}
