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
    
    @Binding var isPullUpFinished: Bool
    
    @State var isPeakSet = false
    @State var isStarted: Bool = false
    @State var isFinished: Bool = false
    @State var bar = 0
    @State var seconds = 3
    @State var initSeconds = 3
    
    // MARK: Circle Animation Part
    func calculateCircleSeconds() {
        var secondCount = 0
        var timerCount = 0
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { timer in
            if secondCount % 6 == 5 {
                seconds -= 1
                bar += 1
                timerCount += 1
                secondCount = 0
                print("I'm alive")
                print(seconds)
            }
            secondCount += 1
            if timerCount >= initSeconds + 1 || isPullUpFinished == true {
                bar = 0
                isStarted = false
                timer.invalidate()
            }
        }
    }
    
    var backButton: some View {
        HStack {
            Image(systemName: "xmark")
            Text("Stop Work Out")
        }
        .foregroundColor(.myGreen)
        .onTapGesture {
            isPullUpFinished = true
            pullUpViewModel.finishWorkOut(routine.id)
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
                        .font(.title)
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
        } else {
            ZStack {
                VStack{
                    Text("\(seconds)")
                        .font(.system(size: 80))
                        .onChange(of: scenePhase) { newPhase in
                            if newPhase == .active {
                                print("Active")
                            } else if newPhase == .inactive {
                                print("Inactive")
                            } else if newPhase == .background {
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
                        .trim(from: 1 - CGFloat(bar) / CGFloat(initSeconds), to: 1)
                        .stroke(Color.myGreen, style: StrokeStyle(lineWidth: 30))
                        .rotationEffect(.init(degrees: -90))
                        .animation(.easeIn, value: bar)
                        .padding(.init(top: 60, leading: 50, bottom: 50, trailing: 50))
                }
            }
            .navigationBarTitle(Text(""), displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:backButton)
            .onAppear {
                if isStarted == false {
                    isStarted = true
                    self.calculateCircleSeconds()
                }
                // Setting Delegate for In-App Notifications
                UNUserNotificationCenter.current().delegate = notification
            }
        }
    }
}

struct PullUpView_Previews: PreviewProvider {
    static var previews: some View {
        PullUpView(routine: Exercises().pullUp[1], pullUpViewModel: PullUpViewModel(Exercises().pullUp[1].term), isPullUpFinished: .constant(false))
            .environment(\.locale, .init(identifier: "ko"))
        PullUpView(routine: Exercises().pullUp[1], pullUpViewModel: PullUpViewModel(Exercises().pullUp[1].term), isPullUpFinished: .constant(false))
            .preferredColorScheme(.dark)
    }
}
