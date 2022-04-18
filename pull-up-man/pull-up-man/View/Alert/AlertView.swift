//
//  AlertView.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/04/14.
//

import SwiftUI

struct AlertView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var notification: NotificationViewModel
    
    var body: some View {
        VStack {
            HStack(alignment: .bottom) {
                Text("Alert")
                    .font(.system(size: 34))
                    .padding()
                    .padding(.top)
                Spacer()
            }
            .padding(.top)
            AlertButtonsView(title: "Push Up Alert")
            AlertButtonsView(title: "Pull Up Alert")
            Text("Hello, \(userViewModel.nickname)!")
                .font(.bold(.system(size: 28))())
            Text("Comming Soon!")
                .font(.subheadline)
            Spacer()
        }
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView()
            .environmentObject(UserViewModel("8880CD65-302C-4C57-AA26-421AEFC9456C"))
    }
}
