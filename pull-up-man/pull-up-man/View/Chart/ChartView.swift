//
//  ChartView.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/04/17.
//

import SwiftUI

struct ChartView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var notification: NotificationViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                if let nickname = userViewModel.user?.nickname {
                    Text("Hello, \(nickname)!")
                        .font(.bold(.system(size: 28))())
                }
                Text("Comming Soon!")
                    .font(.subheadline)
                Spacer()
            }
            .padding()
            .navigationTitle("Chart")
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
            .environmentObject(UserViewModel(UUID(uuidString: "8880CD65-302C-4C57-AA26-421AEFC9456C")!))
    }
}
