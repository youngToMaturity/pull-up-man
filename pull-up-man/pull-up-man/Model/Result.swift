//
//  Result.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/29.
//

import Foundation

struct Result {
    let timeStamp: Date = Date()
    var subject: String
    var sets: [Int]
    
    init(_ subject: String, _ sets: [Int]) {
        self.subject = subject
        self.sets = sets
    }
}
