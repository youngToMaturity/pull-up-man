//
//  PushUpView.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/03.
//

import SwiftUI

struct PushUpView: View {
    let exercise: Exercise
    
    @Environment(\.presentationMode) var presentation
    
    @ObservedObject var pushUpViewModel: PushUpViewModel
    
    @Binding var pushUpResult: [PushUpSet]
    @Binding var isPushUpFinished: Bool
    @Binding var pullUpGoal: LocalizedStringKey
    
    @State var isStarted: Bool = false
    @State var isSkipped: Bool = false
    @State var seconds = 3
    @State var initSeconds = 3
    
    // MARK: - Activate && Deactivate Proximity Sensor to count Push Up
    func activateProximitySensor() {
        print("ExerciseView :: activateProximitySensor")
        UIDevice.current.isProximityMonitoringEnabled = true
        if UIDevice.current.isProximityMonitoringEnabled {
            NotificationCenter.default.addObserver(pushUpViewModel, selector: #selector(pushUpViewModel.didChange), name: UIDevice.proximityStateDidChangeNotification, object: UIDevice.current)
        }
    }
    
    func deactivateProximitySensor() {
        print("ExerciseView :: deactivateProximitySensor")
        UIDevice.current.isProximityMonitoringEnabled = false
        NotificationCenter.default.removeObserver(pushUpViewModel, name: UIDevice.proximityStateDidChangeNotification, object: UIDevice.current)
    }
    
    // MARK: Circle Animation Part
    func calculateCircleSeconds() {
        var timerCount = 0
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            seconds -= 1
            timerCount += 1
            print("I'm alive")
            print(seconds)
            if timerCount >= initSeconds + 1 || isPushUpFinished == true || isSkipped == true {
                isStarted = false
                timer.invalidate()
            }
        }
    }
    
    // MARK: - backButton SetUp: Need Notification to dismiss
    var backButton: some View {
        HStack {
            Image(systemName: "xmark")
            Text("Stop Work Out")
        }
        .foregroundColor(.myGreen)
        .onTapGesture {
            if pushUpViewModel.count != 0 {
                pushUpViewModel.finishSet()
                isPushUpFinished = true
            } else {
                if pushUpViewModel.countList.count != 0 {
                    isPushUpFinished = true
                }
            }
            pullUpGoal = exercise.goal
            pushUpResult = pushUpViewModel.countList
            print(pushUpViewModel.countList)
            pushUpViewModel.finishWorkOut()
            self.presentation.wrappedValue.dismiss()
        }
    }
    
    var body: some View {
        if seconds < 0 {
            // MARK: - Push Up Work out View: Count Push Ups
            VStack {
                VStack {
                    PushUpHeaderView(
                        pushUpViewModel: pushUpViewModel)
                    .padding(.top)
                    Text(exercise.goal)
                        .font(.bold(.system(size: 28))())
                        .padding(.top)
                    Spacer()
                    Spacer()
                    Text("\(pushUpViewModel.count)")
                        .font(.system(size: 80))
                    Spacer()
                    Spacer()
                    PushUpStopButton(pushUpViewModel: pushUpViewModel, seconds: $seconds, initSeconds: $initSeconds)
                    Spacer()
                }
                Spacer()
            }
            .navigationBarTitle(Text(""), displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:backButton)
            .onAppear() {
                self.activateProximitySensor()
            }
            .onDisappear() {
                // Bool을 통해 Alert (@Binding)
                self.deactivateProximitySensor()
            }
        } else {
            // MARK: Initial Screen, Show Screen after animate
            ZStack {
                VStack{
                    Text("\(seconds)")
                        .font(.system(size: 80))
                }
                VStack {
                    Circle()
                        .stroke(Color.myGreen.opacity(0.3), style: StrokeStyle(lineWidth: 30))
                        .padding(.init(top: 60, leading: 50, bottom: 50, trailing: 50))
                }
                VStack {
                    Circle()
                        .trim(from: CGFloat(seconds) / CGFloat(initSeconds), to: 1)
                        .stroke(Color.myGreen, style: StrokeStyle(lineWidth: 30))
                        .rotationEffect(Angle(degrees: 90))
                        .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                        .animation(.easeIn, value: seconds)
                        .padding(.init(top: 60, leading: 50, bottom: 50, trailing: 50))
                }
                if initSeconds >= 30 {
                    VStack {
                        Spacer()
                        Text("Tab anywhere to skip")
                            .font(.system(size: 16))
                            .foregroundColor(Color.gray)
                            .padding(.init(top: 50, leading: 60, bottom: 60, trailing: 60))
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        seconds = -1
                        isSkipped = true
                    }
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
                isSkipped = false
            }
        }
    }
    
}


struct ExerciseView_Previews: PreviewProvider {
    
    static var previews: some View {
        PushUpView(exercise: Exercises().pushUp, pushUpViewModel: PushUpViewModel(), pushUpResult: .constant([
            PushUpSet(id: 1, count: 21),
            PushUpSet(id: 2, count: 12),
            PushUpSet(id: 3, count: 14),
            PushUpSet(id: 4, count: 10),
        ]), isPushUpFinished: .constant(false), pullUpGoal: .constant(Exercises().pushUp.goal))
    }
}
