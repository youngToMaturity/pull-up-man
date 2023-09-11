//
//  UserViewModel.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/24.
//

import Foundation
import Firebase
import SwiftUI

class UserViewModel: ObservableObject {
    let uuid: String
    let db = Firestore.firestore()
    
    @Published var isFirst = false
    @Published var nickname: String
    @Published var age: String
    @Published var id: String
    @Published var record: String
    
    init(_ uuid: String) {
        self.uuid = uuid
        self.nickname = ""
        self.age = ""
        self.id = "undefined"
        self.record = ""
        db.collection("users").document(uuid).getDocument { document, error in
            guard error == nil, let document = document, document.exists, let nickname = document.get("nickname") as? String,
                  let age = document.get("age") as? String, let record = document.get("record") as? String
            else {
                self.isFirst = true
                return
            }
            self.nickname = nickname
            self.age = age
            self.record = record
        }
    }
    
    func updateInfo(_ nickname: String, _ age: String, _ record: String) {
        self.nickname = nickname
        self.age = age
        self.record = record
        self.isFirst = false
        db.collection("users").document(self.uuid).setData([
            "nickname": self.nickname,
            "age": self.age,
            "record": self.record
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
    func setPushUpData(_ records: [PushUpSet], _ kind: LocalizedStringKey) {
        var sets: [Int] = []
        var count: Int = 0
        var totalCount: Int = 0
        for i in 0..<records.count {
            count += records[i].count
            sets.append(records[i].count)
        }
        let result = Result(kind.stringKey, sets)
        db.collection("users").document(self.uuid).collection("result").document(result.subject).setData([
            "\(result.timeStamp)" : result.sets
        ], merge: true)

        if count != 0 {
            db.collection("users").document(self.uuid).collection("counts").document(result.subject).getDocument { doc, err in
                if let totalPushUp = doc?.data()?["total_pushUp"] as? Int {
                    totalCount = totalPushUp
                }
                self.db.collection("users").document(self.uuid).collection("counts").document(result.subject).setData([
                    "recent_pushUp": count,
                    "total_pushUp": count + totalCount
                ], merge: true)
            }
        }
    }
    
    func setPullUpData(_ records: [PullUpSet], _ kind: LocalizedStringKey) {
        var sets: [Int] = []
        for i in 0..<records.count {
            sets.append(records[i].count)
        }
        let result = Result(kind.stringKey, sets)
        db.collection("users").document(self.uuid).collection("result").document(result.subject).setData([
            "\(result.timeStamp)" : result.sets
        ], merge: true)
    }
}
