//
//  PushUpStopButton.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/11.
//

import SwiftUI

struct PushUpStopButton: View {
    @ObservedObject var pushUpViewModel: PushUpViewModel
    @Binding var seconds: Int
    @Binding var initSeconds: Int
    
    var body: some View {
        if pushUpViewModel.count > 0 {
            Button(action: {
                pushUpViewModel.finishSet()
                seconds = 30
                initSeconds = 30
            }) {
                Text("Finish Set")
            }
            .frame(width: 230, height: 45)
            .font(.system(size: 18))
            .foregroundColor(Color.white)
            .background(Color.myGreen)
            .cornerRadius(6.0)
        } else {
            Button(action: {
                pushUpViewModel.finishSet()
                seconds = 30
                initSeconds = 30
            }) {
                Text("Do at least one")
            }
            .frame(width: 230, height: 45)
            .font(.system(size: 18))
            .foregroundColor(Color.white)
            .background(Color.myGreen)
            .cornerRadius(6.0)
            .opacity(0.7)
            .disabled(true)
        }
    }
}
