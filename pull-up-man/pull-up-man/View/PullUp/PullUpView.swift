//
//  PullUpView.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/17.
//

import SwiftUI

struct PullUpView: View {
    let routine: Exercise
    
    var body: some View {
        VStack {
            Text(routine.goal)
            Text(routine.description)
            Text("\(String(routine.term))s")
        }
    }
}

struct PullUpView_Previews: PreviewProvider {
    static var previews: some View {
        PullUpView(routine: Exercises().pullUp[0])
            .environment(\.locale, .init(identifier: "ko"))
    }
}
