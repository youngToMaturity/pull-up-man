//
//  SettingView.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/05/19.
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject var userViewModel: UserViewModel
//    @EnvironmentObject var notification: NotificationViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                SettingGeneralView()
                    .padding(.bottom)
                SettingInfomationView()
                    .padding(.bottom)
                Spacer()
                Text("email: yohwang@student.42seoul.kr")
                    .font(.footnote)
                    .foregroundColor(.gray)
                Text("instagram: yohwangthegoat")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            .padding()
            .navigationTitle("Setting")
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
            .environmentObject(UserViewModel("8880CD65-302C-4C57-AA26-421AEFC9456C"))
            .environment(\.locale, .init(identifier: "ko"))
    }
}
