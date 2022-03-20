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
    
    var setNumber = 1
    
    init(_ term: Int) {
        self.term = term
    }
    
    func finishWorkOut() {
        countList = []
        count = 0
        setNumber = 1
        totalCount = 0
    }
    
    func finishSet(_ id: Int) {
        let pullUpSet = PullUpSet(
            id: setNumber, count: count, term: term
        )
        countList.append(pullUpSet)
        totalCount += count
        print(countList)
        setNumber += 1
        count = 0
        if id == 2 {
            updateTerm()
        }
    }
    
    func updateTerm() {
        term = setNumber * 10
        print(term)
    }
}
