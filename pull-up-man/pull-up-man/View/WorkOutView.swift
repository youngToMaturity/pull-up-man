//
//  WorkOutView.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/01.
//

import SwiftUI

struct WorkOutView: View {
    init() {
        UITableView.appearance().backgroundColor = .white
        UINavigationBar.appearance().largeTitleTextAttributes =
        [.font: UIFont.systemFont(ofSize: 34, weight: .regular)]
    }
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    test()
                } label: {
                    WorkOutListView()
                }
                NavigationLink {
                    test()
                } label: {
                    WorkOutListView()
                }
                NavigationLink {
                    test()
                } label: {
                    WorkOutListView()
                }
                NavigationLink {
                    test()
                } label: {
                    WorkOutListView()
                }
                NavigationLink {
                    test()
                } label: {
                    WorkOutListView()
                }
                NavigationLink {
                    test()
                } label: {
                    WorkOutListView()
                }
            }
            .navigationTitle("Start Work out")
        }
    }
}

struct WorkOutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkOutView()
    }
}
