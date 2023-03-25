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
    let uuid: UUID
    let db = Firestore.firestore()
    
    @Published var isFirst = false
    var user: User?

    init(_ uuid: UUID) {
        self.uuid = uuid
        var user: User?
        if let userData = UserDefaults.standard.object(forKey: "user") as? Data {
            user = try? JSONDecoder().decode(User.self, from: userData)
        }
        if let user {
            self.user = user
        } else {
            db.collection("users").document(uuid.uuidString).getDocument { document, error in
                guard error == nil,
                      let document = document, document.exists,
                      let nickname = document.get("nickname") as? String,
                      let age = document.get("age") as? String
                else {
                    self.isFirst = true
                    return
                }
                self.user = User(uuid: uuid, nickname: nickname, age: age)
                if let user = try? JSONEncoder().encode(self.user) {
                    UserDefaults.standard.set(user, forKey: "user")
                    UserDefaults.standard.synchronize()
                }
            }
        }
    }
    
    func updateInfo(_ nickname: String, _ age: String, _ record: String) {
        self.user = User(uuid: uuid, nickname: nickname, age: age)
        self.isFirst = false
        db.collection("users").document(uuid.uuidString).setData([
            "nickname": nickname,
            "age": age,
            "record": record
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
        if let user {
            UserDefaults.standard.set(user, forKey: "user")
            UserDefaults.standard.synchronize()
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
        db.collection("users").document(uuid.uuidString).collection("result").document(result.subject).setData([
            "\(result.timeStamp)" : result.sets
        ], merge: true)

        if count != 0 {
            db.collection("users").document(uuid.uuidString).collection("counts").document(result.subject).getDocument { doc, err in
                if let totalPushUp = doc?.data()?["total_pushUp"] as? Int {
                    totalCount = totalPushUp
                }
                self.db.collection("users").document(self.uuid.uuidString).collection("counts").document(result.subject).setData([
                    "recent_pushUp": count,
                    "total_pushUp": count + totalCount
                ])
            }
        }
    }
    
    func setPullUpData(_ records: [PullUpSet], _ kind: LocalizedStringKey) {
        var sets: [Int] = []
        for i in 0..<records.count {
            sets.append(records[i].count)
        }
        let result = Result(kind.stringKey, sets)
        db.collection("users").document(uuid.uuidString).collection("result").document(result.subject).setData([
            "\(result.timeStamp)" : result.sets
        ], merge: true)
    }
}
