//
//  AlertDayView.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/05/06.
//

import SwiftUI

struct AlertDayView: View {
    var state: Bool
    let day: String
    var body: some View {
        if state {
            Text(day)
                .fontWeight(.bold)
                .foregroundColor(.myGreen)
        } else {
            Text(day)
        }
    }
}

struct AlertDayView_Previews: PreviewProvider {
    static var previews: some View {
        AlertDayView(state: true, day: "mon")
    }
}
