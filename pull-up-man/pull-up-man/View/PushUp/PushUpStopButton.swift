//
//  PushUpStopButton.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/11.
//

import SwiftUI

struct PushUpStopButton: View {
    var body: some View {
        Button(action: {
            // action
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

struct PushUpStopButton_Previews: PreviewProvider {
    static var previews: some View {
        PushUpStopButton()
    }
}
