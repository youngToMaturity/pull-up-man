//
//  ExerciseViewModel.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/03.
//

import Foundation
import UIKit

class PushUpViewModel: ObservableObject {
    @Published var count = 0
    @Published var countList: [PushUpSet] = []
    
    var setNumber: Int = 1
    var tmp = 0
    
    @objc func didChange(notification: NSNotification) {
        tmp += 1
        if tmp % 2 == 0 {
            count += 1
        }
    }
    
    func finishWorkOut() {
        countList = []
        count = 0
        setNumber = 1
    }
    
    func finishSet() {
        let pushUpSet = PushUpSet(
            id: setNumber, count: count
        )
        countList.append(pushUpSet)
        setNumber += 1
        count = 0
    }
}
