//
//  PushUpStopButton.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/11.
//

import SwiftUI

struct PushUpStopButton: View {
    @Binding var isStarted: Bool
    var pushUpViewModel: PushUpViewModel
    
    var body: some View {
        Button(action: {
            pushUpViewModel.finishSet()
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
