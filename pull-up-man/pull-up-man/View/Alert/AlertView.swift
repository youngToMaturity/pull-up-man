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
            VStack(alignment: .leading) {
                Text("Alert")
                    .font(.bold(.system(size: 28))())
            }
            Text("Hello, \(userViewModel.nickname)!")
                .font(.bold(.system(size: 28))())
            Text("Comming Soon!")
                .font(.subheadline)
        }
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView()
            .environmentObject(UserViewModel("8880CD65-302C-4C57-AA26-421AEFC9456C"))
    }
}
