//
//  MainView.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/01.
//

import SwiftUI

struct MainView: View {
    @State private var selection = 1
    @Binding var isFirstMain: Bool
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        TabView(selection: $selection) {
            WorkOutView()
                .tabItem {
                    Image(systemName: "flame")
                    Text("Work out")
                }
                .tag(1)
            AlertView()
                .tabItem {
                    Image(systemName: "alarm")
                    Text("Alert")
                }
                .tag(2)
            ChartView()
                .tabItem {
                    Image(systemName: "chart.bar")
                    Text("Chart")
                }
                .tag(3)
            SettingView(isFirstMain: $isFirstMain)
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("Setting")
                }
                .tag(4)
        }
        .fullScreenCover(isPresented: $isFirstMain) {
            OnboardingTabView(isFirstMain: $isFirstMain)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(isFirstMain: .constant(false))
            .environment(\.locale, .init(identifier: "ko"))
            .environmentObject(UserViewModel("8880CD65-302C-4C57-AA26-421AEFC9456C"))
            .environmentObject(NotificationViewModel())
        MainView(isFirstMain: .constant(false))
            .preferredColorScheme(.dark)
            .environmentObject(UserViewModel("8880CD65-302C-4C57-AA26-421AEFC9456C"))
            .environmentObject(NotificationViewModel())
    }
}
