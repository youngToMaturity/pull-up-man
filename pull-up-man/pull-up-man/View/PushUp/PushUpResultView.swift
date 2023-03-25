//
//  PushUpResultView.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/16.
//

import SwiftUI

struct PushUpResultView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    
    @Binding var isPushUpFinished: Bool
    @Binding var pushUpResult: [PushUpSet]
    
    var body: some View {
        ScrollView {
            VStack {
                Spacer()
                Text("Push-up result")
                    .font(.bold(.system(size: 28))())
                    .padding(.top, 50)
                Text("Good job, \(userViewModel.user!.nickname)!")
                    .padding(.bottom, 50)
                Spacer()
                ForEach(pushUpResult) { pushUp in
                    HStack {
                        Spacer()
                        Text("Set  \(pushUp.id)")
                            .font(.bold(.system(size: 17))())
                        Spacer()
                        Spacer()
                        Text("\(pushUp.count)")
                            .font(.body)
                        Spacer()
                    }
                    Divider()
                }
                .padding()
                Spacer()
                Button(action: {
                    isPushUpFinished = false
                }) {
                    Text("Close")
                }
            }
        }
    }
}
struct PushUpResultView_Previews: PreviewProvider {
    static var previews: some View {
        PushUpResultView(isPushUpFinished: .constant(true), pushUpResult: .constant([
            PushUpSet(id: 1, count: 21),
            PushUpSet(id: 2, count: 12),
            PushUpSet(id: 3, count: 14),
            PushUpSet(id: 4, count: 10),
        ]))
        .environmentObject(UserViewModel(UUID(uuidString: "8880CD65-302C-4C57-AA26-421AEFC9456C")!))
    }
}
