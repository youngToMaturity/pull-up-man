//
//  Exercise.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/03.
//

import Foundation
import SwiftUI

struct Exercises {
    let pushUp = Exercise(id: 0, image: Image(systemName: "flame.fill"), goal: "Open Goal (Push Up)", description: "Let your phone on floor,\nDo push-up to touch your nose to phone", term: 30, goalSet: 3)
    let pullUp = [
        Exercise(id: 1, image: Image("pull-up"), goal: "Do the best as you can", description: "Monday Routine, 5 sets", term: 90, goalSet: 5),
        Exercise(id: 2, image: Image("pull-up"), goal: "Pyramid set", description: "Tuesday Routine,\nstart from 1, rest 10s,\nRepeat peak 2 times", term: 10, goalSet: 3),
        Exercise(id: 3, image: Image("pull-up"), goal: "3 Grips", description: "Wednesday Routine,\nRepeat half of Monday Routine's 1set,\npull-up / chin-up / wide-pull-up each grip 3 sets", term: 60, goalSet: 9),
        Exercise(id: 4, image: Image("pull-up"), goal: "Maximum sets", description: "Thursday Routine,\nDo Wednesday's count per set,\nDo Maximum sets repeat", term: 60, goalSet: 9),
        Exercise(id: 5, image: Image("pull-up"), goal: "Open Goal (Pull Up)", description: "Do the hardest Routine of week again", term: 60, goalSet: 3)
    ]
}

struct Exercise: Identifiable {
    let id: Int
    let image: Image
    let goal: LocalizedStringKey
    let description: LocalizedStringKey
    let term: Int
    let goalSet: Int
}
