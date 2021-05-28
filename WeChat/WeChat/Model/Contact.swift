//
//  Contact.swift
//  WeChat
//
//  Created by 彭智鑫 on 2021/5/20.
//

import Foundation

struct Contact: Codable, Identifiable {
    var id = UUID()
    let letter: String
    let members: [Member]
}

extension Contact {
    static let all: [Contact] = [c, f, g, n, s, w, z]
    
    static let c = Contact(
        letter: "C",
        members: [.pm, .foodie]
    )
    
    static let f = Contact(
        letter: "F",
        members: [.landlord]
    )
    
    static let g = Contact(
        letter: "G",
        members: [.princess]
    )
    
    static let n = Contact(
        letter: "N",
        members: [.goddess]
    )
    
    static let s = Contact(
        letter: "S",
        members: [.swiftui, .me]
    )
    
    static let w = Contact(
        letter: "W",
        members: [.wang, .nameless]
    )
    
    static let z = Contact(
        letter: "Z",
        members: [.chives]
    )
}
