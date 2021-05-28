//
//  DoubleExtension.swift
//  WeChat
//
//  Created by 彭智鑫 on 2021/5/20.
//

import Foundation

extension Double {
    var date: Date {
        Date(timeIntervalSince1970: self)
    }
}
