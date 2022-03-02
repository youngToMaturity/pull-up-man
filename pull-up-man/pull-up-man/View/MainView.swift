//
//  MainView.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/01.
//

import SwiftUI

struct MainView: View {
    @State private var selection = 1
    
    var body: some View {
        TabView(selection: $selection) {
            WorkOutView()
            .tabItem {
                Image(systemName: "flame")
                Text("Work out")
            }
            .tag(1)
            test()
            .tabItem {
                Image(systemName: "alarm")
                Text("Alarm")
            }
            .tag(2)
            test()
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
    }
}
