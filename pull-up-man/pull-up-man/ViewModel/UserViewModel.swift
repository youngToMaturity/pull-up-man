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
    
    func updateInfo(_ nickname: String, _ age: String, _ record: String) async {
        self.user = User(uuid: uuid, nickname: nickname, age: age)
        let userTable = db.collection("users").document(uuid.uuidString)
        await MainActor.run {
            self.isFirst = false
            userTable.setData([
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
        }
        let exercises = Exercises()
        do {
            try await userTable.collection(exercises.pushUp.goal.stringKey).document("counts").setData([
                "recent_count": 0,
                "total_count": 0
            ])
            UserDefaults.standard.set(0, forKey: "\(exercises.pushUp.goal.stringKey)_count")
            for exercise in exercises.pullUp {
                try await userTable.collection(exercise.goal.stringKey).document("counts").setData([
                    "recent_count": 0,
                    "total_count": 0
                ])
                UserDefaults.standard.set(0, forKey: "\(exercise.goal.stringKey)_count")
            }
        } catch {
            print("Fail to update user")
        }
        if let user {
            if let userData = try? JSONEncoder().encode(user) {
                UserDefaults.standard.set(userData, forKey: "user")
                UserDefaults.standard.synchronize()
            }
        }
    }
    
    func setPushUpData(_ records: [PushUpSet], _ kind: LocalizedStringKey) {
        var sets: [Int] = []
        var count: Int = 0
        for i in 0..<records.count {
            count += records[i].count
            sets.append(records[i].count)
        }
        let result = Result(kind.stringKey, sets)
        let pushUpTable = db.collection("users").document(uuid.uuidString).collection(result.subject)
        pushUpTable.document("result").setData([
            "\(result.timeStamp)" : result.sets
        ], merge: true)
        if count != 0 {
            let countTable = pushUpTable.document("counts")
            let totalCount = UserDefaults.standard.integer(forKey: "\(result.subject)_count") + count
            countTable.setData([
                "recent_count": count,
                "total_count": totalCount
            ])
            UserDefaults.standard.set(totalCount, forKey: "\(result.subject)_count")
            UserDefaults.standard.synchronize()
        }
    }
    
    func setPullUpData(_ records: [PullUpSet], _ kind: LocalizedStringKey) {
        var sets: [Int] = []
        var count: Int = 0
        for i in 0..<records.count {
            count += records[i].count
            sets.append(records[i].count)
        }
        let result = Result(kind.stringKey, sets)
        let pullUpTable = db.collection("users").document(uuid.uuidString).collection(result.subject)
        pullUpTable.document("result").setData([
            "\(result.timeStamp)" : result.sets
        ], merge: true)
        if count != 0 {
            let countTable = pullUpTable.document("counts")
            let totalCount = UserDefaults.standard.integer(forKey: "\(result.subject)_count") + count
            countTable.setData([
                "recent_count": count,
                "total_count": totalCount
            ])
            UserDefaults.standard.set(totalCount, forKey: "\(result.subject)_count")
            UserDefaults.standard.synchronize()
        }
    }
}
