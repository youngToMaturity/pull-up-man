//
//  PullUpView.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/17.
//

import SwiftUI
import UserNotifications

struct PullUpView: View {
    let routine: Exercise
    
    @Environment(\.presentationMode) var presentation
    @Environment(\.scenePhase) var scenePhase
    
    @EnvironmentObject var notification: NotificationViewModel
    @ObservedObject var pullUpViewModel: PullUpViewModel
    
    @Binding var pullUpResult: [PullUpSet]
    @Binding var isPullUpFinished: Bool
    @Binding var pullUpGoal: LocalizedStringKey
    
    @State var isPeakSet = false
    @State var isStarted: Bool = false
    @State var seconds = 3
    @State var initSeconds = 3
    @State var backgroundSeconds = 0
    @State var wasBackground: Bool = false
    @State var backgroundDate = Date()
    
    // MARK: Circle Animation Part
    func calculateCircleSeconds() {
        var timerCount = 0
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            seconds -= 1
            timerCount += 1
            if backgroundSeconds < 0 {
                seconds += backgroundSeconds
                timerCount -= backgroundSeconds
                backgroundSeconds = 0
            }
            print("I'm alive")
            print(seconds)
            if timerCount >= initSeconds + 1 || isPullUpFinished == true {
                isStarted = false
                timer.invalidate()
            }
        }
    }
    
    func cleanSetNotification() {
        let current = UNUserNotificationCenter.current()
        current.removePendingNotificationRequests(withIdentifiers: ["PullUp"])
        current.removeDeliveredNotifications(withIdentifiers: ["PullUp"])
    }
    
    var backButton: some View {
        HStack {
            Image(systemName: "xmark")
            Text("Stop Work Out")
        }
        .foregroundColor(.myGreen)
        .onTapGesture {
            pullUpGoal = pullUpViewModel.goal
            if pullUpViewModel.count != 0 {
                pullUpViewModel.finishSet(routine.id, false)
                isPullUpFinished = true
            } else {
                if pullUpViewModel.countList.count != 0 {
                    isPullUpFinished = true
                }
            }
            pullUpResult = pullUpViewModel.countList
            pullUpViewModel.finishWorkOut(routine.id)
            cleanSetNotification()
            self.presentation.wrappedValue.dismiss()
        }
    }
    
    var body: some View {
        if seconds < 0 {
            VStack {
                PullUpHeaderView(pullUpViewModel: pullUpViewModel)
                    .padding(.bottom)
                VStack {
                    Text(routine.goal)
                        .font(.bold(.system(size: 28))())
                    Text(routine.description)
                        .font(.caption)
                        .multilineTextAlignment(.center)
                        .padding()
                }
                Spacer()
                Text("\(pullUpViewModel.count)")
                    .font(.system(size: 80))
                Spacer()
                PullUpButtonsView(isPeakSet: $isPeakSet, seconds: $seconds, initSeconds: $initSeconds, pullUpViewModel: pullUpViewModel, routine: routine)
                Spacer()
            }
            .navigationBarTitle(Text(""), displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:backButton)
            .onAppear {
                UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation") // Forcing the rotation to portrait
                AppDelegate.orientationLock = .portrait // And making sure it stays that way
            }.onDisappear {
                AppDelegate.orientationLock = .all // Unlocking the rotation when leaving the view
            }
        } else {
            ZStack {
                VStack{
                    Text("\(seconds)")
                        .font(.system(size: 80))
                        .onChange(of: scenePhase) { newPhase in
                            if newPhase == .active {
                                if wasBackground {
                                    backgroundSeconds = Int(backgroundDate.timeIntervalSinceNow)
                                    print(backgroundSeconds)
                                    wasBackground = false
                                }
                                print("Active")
                            } else if newPhase == .inactive {
                                print("Inactive")
                            } else if newPhase == .background {
                                wasBackground = true
                                backgroundDate = Date()
                                print("Background")
                            }
                        }
                }
                VStack {
                    Circle()
                        .stroke(Color.myGreen.opacity(0.3), style: StrokeStyle(lineWidth: 30))
                        .padding(.init(top: 60, leading: 50, bottom: 50, trailing: 50))
                }
                VStack {
                    Circle()
                        .trim(from:  CGFloat(seconds) / CGFloat(initSeconds), to: 1)
                        .stroke(Color.myGreen, style: StrokeStyle(lineWidth: 30))
                        .rotationEffect(Angle(degrees: 90))
                        .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                        .animation(.easeIn, value: seconds)
                        .padding(.init(top: 60, leading: 50, bottom: 50, trailing: 50))
                }
            }
            .navigationBarTitle(Text(""), displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:backButton)
            .onAppear {
                if isStarted == false {
                    isStarted = true
                    isPullUpFinished = false // 나중에 PullUpResultView에서 처리. 지금은 임시로
                    self.calculateCircleSeconds()
                }
                // Setting Delegate for In-App Notifications
                UNUserNotificationCenter.current().delegate = notification
            }
        }
    }
}

struct PullUpView_Previews: PreviewProvider {
    static let notification = NotificationViewModel()
    static var previews: some View {
        PullUpView(routine: Exercises().pullUp[1], pullUpViewModel: PullUpViewModel(Exercises().pullUp[1]), pullUpResult: .constant([]), isPullUpFinished: .constant(false), pullUpGoal: .constant(Exercises().pullUp[1].goal))
            .environmentObject(notification)
            .environment(\.locale, .init(identifier: "ko"))
        PullUpView(routine: Exercises().pullUp[1], pullUpViewModel: PullUpViewModel(Exercises().pullUp[1]), pullUpResult: .constant([]), isPullUpFinished: .constant(false), pullUpGoal: .constant(Exercises().pullUp[1].goal))
            .environmentObject(notification)
            .preferredColorScheme(.dark)
    }
}
