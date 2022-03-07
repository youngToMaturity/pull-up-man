//
//  Exercise.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/03.
//

import Foundation
import SwiftUI

struct Exercises {
    let pushUp = Exercise(id: 0, image: Image(systemName: "flame.fill"), goal: "Open Goal", description: "Let your phone on floor, Do push-up to touch your chin to phone / 1 set is 2 mins", term: "30s")
    let pullUp = [
        Exercise(id: 1, image: Image("pull-up"), goal: "Do the best as you can", description: "Monday Routine, 5 sets", term: "90s"),
        Exercise(id: 2, image: Image("pull-up"), goal: "Pyramid set", description: "Tuesday Routine, start from 1, rest 10s, Repeat peak 2 times", term: "N secs"),
        Exercise(id: 3, image: Image("pull-up"), goal: "3 Grips", description: "Wednesday Routine, Repeat half of Monday Routine's 1set, pull-up / chin-up / wide-pull-up each grip 3 sets", term: "60s"),
        Exercise(id: 4, image: Image("pull-up"), goal: "Maximum sets", description: "Thursday Routine, Do Wednesday's count per set, Do Maximum sets repeat", term: "60s"),
        Exercise(id: 5, image: Image("pull-up"), goal: "Open Goal", description: "Do the hardest Routine of week again", term: "60s")
    ]
}

struct Exercise: Identifiable {
    let id: Int
    let image: Image
    let goal: LocalizedStringKey
    let description: LocalizedStringKey
    let term: String
}
