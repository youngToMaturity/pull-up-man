//
//  SettingGeneralView.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/05/24.
//

import SwiftUI

struct SettingGeneralView: View {
    @Binding var isFirstMain: Bool
    var body: some View {
        VStack {
            HStack {
                Text("General")
                    .font(.bold(.system(size: 20))())
                Spacer()
            }
            HStack {
                Text("Show Onboarding view")
                    .allowsTightening(true)
                    .foregroundColor(.myBlack)
                    .padding()
                    .onTapGesture {
                        isFirstMain.toggle()
                    }
                Spacer()
            }.frame(height: 30, alignment: .leading)
            Divider()
            HStack {
                Text("Authorization")
                    .foregroundColor(.myBlack)
                    .padding()
                Spacer()
            }.frame(height: 30, alignment: .leading)
            .onTapGesture {
                if let appSettings = URL(string: UIApplication.openSettingsURLString){
                    UIApplication.shared.open(appSettings, options: [:], completionHandler: nil)
                }
            }
            Divider()
        }
    }
}

struct SettingGeneralView_Previews: PreviewProvider {
    static var previews: some View {
        SettingGeneralView(isFirstMain: .constant(false))
    }
}
