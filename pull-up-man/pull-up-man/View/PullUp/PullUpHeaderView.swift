//
//  PullUpHeaderView.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/18.
//

import SwiftUI

struct PullUpHeaderView: View {
    
    @ObservedObject var pullUpViewModel: PullUpViewModel
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Current Set")
                        .font(.bold(.system(size: 17))())
                    Label("\(String(pullUpViewModel.setNumber))",
                          systemImage: "flame.circle")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Set Interval")
                        .font(.bold(.system(size: 17))())
                    Label("\(String(pullUpViewModel.term)) s",
                          systemImage: "clock")
                }
            }
        }
        .padding(.horizontal)
    }
}

struct PullUpHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        PullUpHeaderView(pullUpViewModel: PullUpViewModel(Exercises().pullUp[1]))
    }
}
