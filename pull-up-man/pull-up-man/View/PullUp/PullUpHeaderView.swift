//
//  PullUpHeaderView.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/18.
//

import SwiftUI

struct PullUpHeaderView: View {
    
    @State var term: Int
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Current Set")
                    Label("1",
                          systemImage: "flame.circle")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Set Interval")
                    Label("\(String(term)) s",
                          systemImage: "clock")
                }
            }
        }
        .padding(.horizontal)
    }
}

struct PullUpHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        PullUpHeaderView(term: 10)
    }
}
