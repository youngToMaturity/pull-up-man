//
//  SettingInfomationView.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/05/20.
//

import SwiftUI
// 정보
// - 리뷰
// - 깃헙
// - 벨로그
// - 이메일

struct SettingInfomationView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Infomation")
                    .font(.bold(.system(size: 20))())
                    .padding()
                Spacer()
            }
            VStack {
                HStack {
                    Text("A")
                        .padding()
                    Spacer()
                }.frame(height: 30, alignment: .leading)
                Divider()
            }
        }
    }
}

struct SettingInfomationView_Previews: PreviewProvider {
    static var previews: some View {
        SettingInfomationView()
    }
}
