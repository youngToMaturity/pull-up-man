//
//  ExerciseHeaderView.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/06.
//

import SwiftUI

struct PushUpHeaderView: View {
    @ObservedObject var pushUpViewModel: PushUpViewModel

    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("secondsElapsed", systemImage: "clock")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Counts")
                        .font(.caption)
                    HStack {
                        ForEach(pushUpViewModel.countList) { pushUp in
                            Text(" \(String(pushUp.count))")
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}
