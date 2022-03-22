//
//  PushUpResultView.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/16.
//

import SwiftUI

struct PushUpResultView: View {
    @Binding var isPushUpFinished: Bool
    @Binding var pushUpResult: [PushUpSet]
    
    var body: some View {
        VStack {
            Text("Push-up result")
                    .padding()
            ForEach(pushUpResult) { pushUp in
                HStack {
                    Text("Set \(pushUp.id)")
                    Text(": \(pushUp.count)")
                }
            }
            .padding()
            Button(action: {
                isPushUpFinished = false
            }) {
                Text("Close")
            }
        }
    }
}

struct PushUpResultView_Previews: PreviewProvider {
    static var previews: some View {
        PushUpResultView(isPushUpFinished: .constant(true), pushUpResult: .constant([
            PushUpSet(id: 1, count: 21),
            PushUpSet(id: 2, count: 12),
            PushUpSet(id: 3, count: 14),
            PushUpSet(id: 4, count: 10),
        ]))
    }
}
