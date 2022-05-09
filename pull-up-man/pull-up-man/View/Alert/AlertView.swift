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
    
    init() {
        if UserDefaults.standard.array(forKey: "pushup") == nil {
            UserDefaults.standard.set([
                false, false, false, false, false, false, false
            ], forKey: "pushup")
        }
        if UserDefaults.standard.string(forKey: "pushupTime") == nil {
            UserDefaults.standard.set("", forKey: "pushupTime")
        }
        if UserDefaults.standard.array(forKey: "pullup") == nil {
            UserDefaults.standard.set([
                false, false, false, false, false, false, false
            ], forKey: "pullup")
        }
        if UserDefaults.standard.string(forKey: "pullupTime") == nil {
            UserDefaults.standard.set("", forKey: "pullupTime")
        }
    }
    
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
    }
}
