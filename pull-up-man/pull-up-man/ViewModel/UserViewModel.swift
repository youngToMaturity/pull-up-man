//
//  UserViewModel.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/24.
//

import Foundation
import Firebase

class UserViewModel: ObservableObject {
    let uuid: String
    let db = Firestore.firestore()
    
    @Published var isFirst = false
    @Published var nickname: String
    @Published var id: String
    
    init(_ uuid: String) {
        self.uuid = uuid
        self.nickname = ""
        self.id = "undefined"
        db.collection("user").document(uuid).getDocument { document, error in
            guard error == nil, let document = document, document.exists, let nickname = document.get("nickname") as? String
            else {
                self.isFirst = true
                return
            }
            self.nickname = nickname
        }
    }
}
