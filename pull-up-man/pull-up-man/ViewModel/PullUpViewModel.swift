//
//  PullUpViewModel.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/19.
//

import Foundation
import SwiftUI

class PullUpViewModels {
    var array: [PullUpViewModel] = [
        PullUpViewModel(Exercises().pullUp[0]),
        PullUpViewModel(Exercises().pullUp[1]),
        PullUpViewModel(Exercises().pullUp[2]),
        PullUpViewModel(Exercises().pullUp[3]),
        PullUpViewModel(Exercises().pullUp[4]),
    ]
}

class PullUpViewModel: ObservableObject {
    @Published var count = 0
    @Published var countList: [PullUpSet] = []
    @Published var totalCount: Int = 0
    @Published var routine: Exercise
    @Published var wasPeakSet: Bool = false
    
    var setNumber = 1
    var goal: LocalizedStringKey
    var term: Int
    
    init(_ routine: Exercise) {
        self.routine = routine
        self.goal = routine.goal
        self.term = routine.term
    }

    func finishWorkOut(_ id: Int) {
        countList = []
        count = 0
        setNumber = 1
        totalCount = 0
        wasPeakSet = false
        if id == 2 {
            term = 10
        }
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
//        count = term / 10
        // count를 하는것 대신에 목표 count를 표시해주는게 어떨지?
        print(term)
    }
}
