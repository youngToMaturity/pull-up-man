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
}
