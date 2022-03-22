//
//  PullUpResultView.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/22.
//

import SwiftUI

struct PullUpResultView: View {
    @Binding var isPullUpFinished: Bool
    @Binding var pullUpResult: [PullUpSet]
    
    var body: some View {
        VStack {
            Text("Pull-up result")
                    .padding()
            ForEach(pullUpResult) { pullUp in
                HStack {
                    Text("Set \(pullUp.id)")
                    Text(": \(pullUp.count)")
                }
            }
            .padding()
            Button(action: {
                isPullUpFinished = false
            }) {
                Text("Close")
            }
        }
    }
}

//struct PullUpResultView_Previews: PreviewProvider {
//    static var previews: some View {
//        PullUpResultView()
//    }
//}
