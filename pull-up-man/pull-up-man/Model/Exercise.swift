//
//  Exercise.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/03.
//

import Foundation
import SwiftUI

struct Exercises {
    let pushUp = Exercise(id: 0, image: Image(systemName: "flame.fill"), goal: "Open Goal (Push Up)", description: "Put your phone on floor,\npush up your nose to get closer to phone", term: 30, goalSet: 3)
    let pullUp = [
        Exercise(id: 1, image: Image("pull-up"), goal: "Do the best as you can", description: "Monday Routine, 5 sets", term: 90, goalSet: 5),
        Exercise(id: 2, image: Image(systemName: "pyramid"), goal: "Pyramid set", description: "Tuesday Routine,\nstart from 1, rest 10s,\nRepeat peak twice", term: 10, goalSet: 3),
        Exercise(id: 3, image: Image(systemName: "3.circle"), goal: "3 Grips", description: "Wednesday Routine,\nHalf of Monday Routine's 1set,\nPull-up / Chin-up / Wide-pull-up 3 sets each", term: 60, goalSet: 9),
        Exercise(id: 4, image: Image(systemName: "bolt.fill"), goal: "Maximum sets", description: "Thursday Routine,\nSame number as Wednesday routine, Repeat as many sets as possible, Add number from next week when achieving 9 sets", term: 60, goalSet: 9),
        Exercise(id: 5, image: Image(systemName: "flame.fill"), goal: "Open Goal (Pull Up)", description: "Do the hardest Routine of week again", term: 60, goalSet: 3)
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
