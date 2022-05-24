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
    
    var pushUpState = UserDefaults.standard.array(forKey: "pushup") as? [Bool] ?? [false, false, false, false, false, false, false]
    var pushUpTime = UserDefaults.standard.string(forKey: "pushupTime") ?? ""
    var pullUpState = UserDefaults.standard.array(forKey: "pullup") as? [Bool] ?? [false, false, false, false, false, false, false]
    var pullUpTime = UserDefaults.standard.string(forKey: "pullupTime") ?? ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                AlertButtonsView(daySelected: pushUpState, title: "Push Up Alert")
                AlertButtonsView(daySelected: pullUpState, title: "Pull Up Alert")
                Spacer()
            }
            .navigationTitle("Alert")
        }
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView()
            .environmentObject(UserViewModel("8880CD65-302C-4C57-AA26-421AEFC9456C"))
            .environment(\.locale, .init(identifier: "ko"))
    }
}
