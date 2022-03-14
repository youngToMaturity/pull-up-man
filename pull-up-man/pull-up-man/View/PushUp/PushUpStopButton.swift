//
//  PushUpStopButton.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/11.
//

import SwiftUI

struct PushUpStopButton: View {
    @Binding var seconds: Int
    @Binding var initSeconds: Int
    @Binding var isStarted: Bool
    
    var pushUpViewModel: PushUpViewModel
    
    func finishSet() {
        let pushUpSet = PushUpSet(
            id: pushUpViewModel.setNumber, count: pushUpViewModel.count
        )
        seconds = 30
        initSeconds = 30
        isStarted.toggle()
        pushUpViewModel.countList.append(pushUpSet)
        pushUpViewModel.setNumber += 1
        pushUpViewModel.count = 0
    }
    
    var body: some View {
        Button(action: {
            finishSet()
        }) {
            Text("Finish Set")
        }
        .frame(width: 230, height: 45)
        .font(.system(size: 18))
        .foregroundColor(Color.white)
        .background(Color.myGreen)
        .cornerRadius(6.0)
    }
}

//struct PushUpStopButton_Previews: PreviewProvider {
//    @Binding var seconds
//    static var previews: some View {
//        PushUpStopButton(seconds: seconds, pushUpViewModel: PushUpViewModel())
//    }
//}
