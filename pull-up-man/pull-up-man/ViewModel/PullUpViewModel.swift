//
//  PullUpViewModel.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/19.
//

import Foundation

class PullUpViewModel: ObservableObject {
    @Published var count = 0
    @Published var countList: [PullUpSet] = []
    @Published var totalCount: Int = 0
    @Published var term: Int
    @Published var wasPeakSet: Bool = false
    
    var setNumber = 1
    
    init(_ term: Int) {
        self.term = term
    }
    
    func finishWorkOut() {
        countList = []
        count = 0
        setNumber = 1
        totalCount = 0
        wasPeakSet = false
    }
    
    func finishSet(_ id: Int, _ isPeakSet: Bool) {
        let pullUpSet = PullUpSet(
            id: setNumber, count: count, term: term
        )
        countList.append(pullUpSet)
        totalCount += count
        print(countList)
        setNumber += 1
        count = 0
        if id == 2 {
            updateTerm(isPeakSet)
        }
    }
    
    func updateTerm(_ isPeakSet: Bool) {
        if wasPeakSet {
            if term > 10 {
                term -= 10
            }
        } else {
            if isPeakSet {
                wasPeakSet = true
            } else {
                term = setNumber * 10
            }
        }
        count = term / 10
        print(term)
    }
}
