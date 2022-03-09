//
//  ExerciseHeaderView.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/06.
//

import SwiftUI

struct PushUpHeaderView: View {
    @State var secondsElapsed: Int
    @State var isFinished: Bool = false
    let totalSeconds: Int
    
    private var progress: Double {
        guard totalSeconds > 0 else { return 1 }
        return Double(secondsElapsed) / Double(totalSeconds)
    }
    
    func calculateSeconds() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            secondsElapsed += 1
            if secondsElapsed == totalSeconds {
                isFinished = true
                timer.invalidate()
            }
        }
    }
    
    var body: some View {
        VStack {
            ProgressView(value: progress, total: 1)
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("\(secondsElapsed)", systemImage: "clock")
                }
                Spacer()
                // edit it to push-up counts
                VStack(alignment: .trailing) {
                    Text("Counts")
                        .font(.caption)
                }
            }
            .sheet(isPresented: $isFinished) {
                test()
            }
            .onAppear() {
                self.calculateSeconds()
            }
            .padding(.horizontal)
        }
    }
}

struct ExerciseHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        PushUpHeaderView(secondsElapsed: 0, totalSeconds: 120)
            .previewLayout(.sizeThatFits)
    }
}
