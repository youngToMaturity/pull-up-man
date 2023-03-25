//
//  User.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2023/03/25.
//

import Foundation

struct User: Codable {
    let uuid: UUID
    let nickname: String
    let age: String
}
