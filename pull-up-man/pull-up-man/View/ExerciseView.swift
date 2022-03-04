//
//  ExerciseView.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/03.
//

import SwiftUI

struct ExerciseView: View {
    let exercise: Exercise
    @State private var count = 0
    
    var body: some View {
        VStack {
            VStack {
                Text(exercise.goal)
                    .font(.system(size: 28))
                    .padding()
                Text(exercise.description)
                    .padding()
                Spacer()
                Text("\(count)")
                    .font(.system(size: 100))
                    .padding()
                Spacer()
            }
            Spacer()
        }
    }
}

struct ExerciseView_Previews: PreviewProvider {
    
    static var previews: some View {
        ExerciseView(exercise: Exercises().pushUp)
    }
}
