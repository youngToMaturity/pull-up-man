//
//  WorkOutView.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/01.
//

import SwiftUI

struct WorkOutView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    @State var isPushUpFinished: Bool = false
    @State var pushUpResult: [PushUpSet] = []
    
    var pushUpViewModel = PushUpViewModel()
    let exercise: Exercises = Exercises()
   
    init() {
        UITableView.appearance().backgroundColor = UIColor(named: "MyWhite")
        UINavigationBar.appearance().largeTitleTextAttributes =
        [.font: UIFont.systemFont(ofSize: 34, weight: .regular)]
    }
    
    var body: some View {
        NavigationView {
            List {
                Text("Push-up")
                    .listRowInsets(EdgeInsets(.init(top: 0, leading: 10, bottom: 0, trailing: 0)))
                NavigationLink {
                    PushUpView(exercise: exercise.pushUp, pushUpViewModel: pushUpViewModel, pushUpResult: $pushUpResult, isPushUpFinished: $isPushUpFinished)
                } label: {
                    WorkOutListView(exercise: exercise.pushUp)
                }
                .listRowInsets(EdgeInsets(.init(top: 0, leading: 10, bottom: 0, trailing: 0)))
                Text("Pull-up")
                    .listRowInsets(EdgeInsets(.init(top: 0, leading: 10, bottom: 0, trailing: 0)))
                ForEach(exercise.pullUp) { routine in
                    NavigationLink {
                        PullUpView(routine: routine)
                    } label: {
                        WorkOutListView(exercise: routine)
                    }
                    .listRowInsets(EdgeInsets(.init(top: 0, leading: 10, bottom: 0, trailing: 0)))
                }
            }
            .sheet(isPresented: $isPushUpFinished, onDismiss: didDismiss) {
                PushUpResultView(isPushUpFinished: $isPushUpFinished, pushUpResult: $pushUpResult)
            }
            .navigationBarTitle("Start Work out")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func didDismiss() {
        pushUpResult = []
        print(pushUpResult)
        print(isPushUpFinished)
    }
}

struct WorkOutView_Previews: PreviewProvider {
    
    static var previews: some View {
        WorkOutView()
            .environment(\.locale, .init(identifier: "ko"))
        WorkOutView()
            .preferredColorScheme(.dark)
    }
}
