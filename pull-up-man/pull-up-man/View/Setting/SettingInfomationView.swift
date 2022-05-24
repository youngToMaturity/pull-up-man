//
//  SettingInfomationView.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/05/20.
//

import SwiftUI

struct SettingInfomationView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Information")
                    .font(.bold(.system(size: 20))())
                Spacer()
            }
            VStack {
//                Link(destination: URL(string: "앱스토어 주소?")!, label: {
//                    HStack {
//                        Text("Appstore")
//                            .foregroundColor(.myBlack)
//                            .padding()
//                        Spacer()
//                    }.frame(height: 30, alignment: .leading)
//                })
//                Divider()
                Link(destination: URL(string: "https://github.com/loopbackseal")!, label: {
                    HStack {
                        Text("Developer github")
                            .foregroundColor(.myBlack)
                            .padding()
                        Spacer()
                    }.frame(height: 30, alignment: .leading)
                })
                Divider()
                Link(destination: URL(string: "https://velog.io/@loopbackseal")!, label: {
                    HStack {
                        Text("Developer blog")
                            .foregroundColor(.myBlack)
                            .padding()
                        Spacer()
                    }.frame(height: 30, alignment: .leading)
                })
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
