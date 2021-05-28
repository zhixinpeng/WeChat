//
//  Media.swift
//  WeChat
//
//  Created by 彭智鑫 on 2021/5/20.
//

import Foundation

struct Media: Codable, Equatable, Identifiable {
    var id = UUID()
    let cover: String?
    let width: Double?
    let height: Double?
    let url: String
}
