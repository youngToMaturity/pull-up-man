//
//  SettingView.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/05/19.
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @Binding var isFirstMain: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                SettingGeneralView(isFirstMain: $isFirstMain)
                    .padding(.bottom)
                SettingInfomationView()
                    .padding(.bottom)
                Spacer()
                Text("email: young961027@gmail.com")
                    .font(.footnote)
                    .foregroundColor(.gray)
                Text("instagram: youngtomaturity")
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
        SettingView(isFirstMain: .constant(true))
            .environmentObject(UserViewModel(UUID(uuidString: "8880CD65-302C-4C57-AA26-421AEFC9456C")!))
            .environment(\.locale, .init(identifier: "ko"))
    }
}
