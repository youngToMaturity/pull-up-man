//
//  MainView.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/01.
//

import SwiftUI

struct MainView: View {
    @State private var selection = 1
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
            test()
            .tabItem {
                Image(systemName: "gearshape")
                Text("Setting")
            }
            .tag(4)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environment(\.locale, .init(identifier: "ko"))
            .environmentObject(UserViewModel("8880CD65-302C-4C57-AA26-421AEFC9456C"))
        MainView()
            .preferredColorScheme(.dark)
            .environmentObject(UserViewModel("8880CD65-302C-4C57-AA26-421AEFC9456C"))
    }
}
