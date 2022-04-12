//
//  ExerciseHeaderView.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/06.
//

import SwiftUI

struct PushUpHeaderView: View {
    @ObservedObject var pushUpViewModel: PushUpViewModel

    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Current Set")
                        .font(.bold(.system(size: 17))())
                    Label("\(pushUpViewModel.setNumber)", systemImage: "flame.circle")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Counts")
                        .font(.bold(.system(size: 17))())
                    HStack {
                        ForEach(pushUpViewModel.countList) { pushUp in
                            Text(" \(String(pushUp.count))")
                        }
                        Text(" \(pushUpViewModel.count)")
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}
