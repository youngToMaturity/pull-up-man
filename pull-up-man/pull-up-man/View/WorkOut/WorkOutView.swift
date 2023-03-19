//
//  WorkOutView.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/01.
//

import SwiftUI

struct WorkOutView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    @EnvironmentObject var notification: NotificationViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    
    @State var isPushUpFinished: Bool = false
    @State var isPullUpFinished: Bool = false
    @State var pushUpResult: [PushUpSet] = []
    @State var pullUpResult: [PullUpSet] = []
    @State var pullUpGoal: LocalizedStringKey = Exercises().pullUp[0].goal
    
    var pushUpViewModel = PushUpViewModel()
    var pullUpViewModels = PullUpViewModels()
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
                    PushUpView(exercise: exercise.pushUp, pushUpViewModel: pushUpViewModel, pushUpResult: $pushUpResult, isPushUpFinished: $isPushUpFinished, pullUpGoal: $pullUpGoal)
                } label: {
                    WorkOutListView(exercise: exercise.pushUp)
                }
                .listRowInsets(EdgeInsets(.init(top: 0, leading: 10, bottom: 0, trailing: 0)))
                Text("Pull-up")
                    .listRowInsets(EdgeInsets(.init(top: 0, leading: 10, bottom: 0, trailing: 0)))
                ForEach(exercise.pullUp) { routine in
                    NavigationLink {
                        PullUpView(routine: routine, pullUpViewModel: pullUpViewModels.array[routine.id - 1], pullUpResult: $pullUpResult, isPullUpFinished: $isPullUpFinished, pullUpGoal: $pullUpGoal)
                    } label: {
                        WorkOutListView(exercise: routine)
                    }
                    .listRowInsets(EdgeInsets(.init(top: 0, leading: 10, bottom: 0, trailing: 0)))
                }
            }
            .sheet(isPresented: $isPushUpFinished, onDismiss: didDismiss) {
                PushUpResultView(isPushUpFinished: $isPushUpFinished, pushUpResult: $pushUpResult)
            }
            .sheet(isPresented: $isPullUpFinished, onDismiss: didDismiss) {
                PullUpResultView(isPullUpFinished: $isPullUpFinished, pullUpResult: $pullUpResult, pullUpGoal: $pullUpGoal)
            }
            .navigationBarTitle("Start Work out")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear {
            // Permissions
            UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .sound, .alert]) { (_, _) in
            }
        }
    }
    
    func didDismiss() {
        if pushUpResult.count != 0 {
            userViewModel.setPushUpData(pushUpResult, pullUpGoal)
        } else if pullUpResult.count != 0 {
            userViewModel.setPullUpData(pullUpResult, pullUpGoal)
        }
        pushUpResult = []
        pullUpResult = []
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
