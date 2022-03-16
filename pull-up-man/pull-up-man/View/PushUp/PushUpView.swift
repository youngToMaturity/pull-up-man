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
    @State var isFinished: Bool = false
    @State var bar = 0
    @State var seconds = -1
    @State var initSeconds = 5
    
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
            if timerCount >= initSeconds + 1 || isFinished == true {
                bar = 0
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
            isFinished = true
            if pushUpViewModel.count != 0 {
                pushUpViewModel.finishSet()
            }
            print(pushUpViewModel.countList)
            // @Binding 통해 pushUpViewModel.count && countListWorkOutView에 전달
            pushUpViewModel.finishWorkOut()
            self.presentation.wrappedValue.dismiss()
        }
    }
    
    var body: some View {
        if seconds < 0 {
            // MARK: - Push Up Work out View: Count Push Ups
            ZStack {
                VStack {
                    VStack {
                        PushUpHeaderView(
                            pushUpViewModel: pushUpViewModel)
                            .padding(.top)
                        Text(exercise.goal)
                            .font(.system(size: 28))
                            .padding(.top)
                        Spacer()
                        Spacer()
                        Text("\(pushUpViewModel.count)")
                            .font(.system(size: 100))
                        Spacer()
                        Spacer()
                        PushUpStopButton(pushUpViewModel: pushUpViewModel, seconds: $seconds, initSeconds: $initSeconds)
                        Spacer()
                    }
                    Spacer()
                }
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
                        .font(.system(size: 100))
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
                self.calculateCircleSeconds()
            } .onDisappear {
                bar = 0
            }
        }
    }
    
}


struct ExerciseView_Previews: PreviewProvider {

    static var previews: some View {
        PushUpView(exercise: Exercises().pushUp, pushUpViewModel: PushUpViewModel())
    }
}
