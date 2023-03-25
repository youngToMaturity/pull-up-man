//
//  PullUpResultView.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/22.
//

import SwiftUI

struct PullUpResultView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    
    @Binding var isPullUpFinished: Bool
    @Binding var pullUpResult: [PullUpSet]
    @Binding var pullUpGoal: LocalizedStringKey
    
    var body: some View {
        ScrollView {
            VStack {
                Spacer()
                Text(pullUpGoal)
                    .font(.bold(.system(size: 28))())
                    .padding(.top, 50)
                Text("Good job, \(userViewModel.user!.nickname)!")
                    .padding(.bottom, 50)
                Spacer()
                ForEach(pullUpResult) { result in
                    HStack {
                        Spacer()
                        Text("Set  \(result.id)")
                            .font(.bold(.system(size: 17))())
                        Spacer()
                        Text("\(result.count)")
                            .font(.body)
                        Spacer()
                    }
                    Divider()
                }
                .padding()
                Spacer()
                Button(action: {
                    isPullUpFinished = false
                }) {
                    Text("Close").fontWeight(.bold)
                }
            }
        }
    }
}

struct PullUpResultView_Previews: PreviewProvider {
    static var previews: some View {
        PullUpResultView(isPullUpFinished: .constant(true), pullUpResult: .constant([
            PullUpSet(id: 1, count: 1, term: 10),
            PullUpSet(id: 2, count: 2, term: 20),
            PullUpSet(id: 3, count: 3, term: 30),
            PullUpSet(id: 4, count: 3, term: 30),
            PullUpSet(id: 5, count: 2, term: 20),
            PullUpSet(id: 6, count: 1, term: 10),
        ]), pullUpGoal: .constant(Exercises().pullUp[1].goal))
        .environmentObject(UserViewModel(UUID(uuidString: "8880CD65-302C-4C57-AA26-421AEFC9456C")!))
        .environment(\.locale, .init(identifier: "ko"))
    }
}
