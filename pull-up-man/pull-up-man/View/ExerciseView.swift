//
//  ExerciseView.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/03.
//

import SwiftUI

struct ExerciseView: View {
    let exercise: Exercise
    @ObservedObject var proximityObserver = ExerciseViewModel()
    @State var seconds = 5
    @State var bar = 0
    
    func activateProximitySensor() {
        print("ExerciseView :: activateProximitySensor")
        UIDevice.current.isProximityMonitoringEnabled = true
        if UIDevice.current.isProximityMonitoringEnabled {
            NotificationCenter.default.addObserver(proximityObserver, selector: #selector(proximityObserver.didChange), name: UIDevice.proximityStateDidChangeNotification, object: UIDevice.current)
        }
    }
    
    func deactivateProximitySensor() {
        print("ExerciseView :: deactivateProximitySensor")
        proximityObserver.count = 0
        UIDevice.current.isProximityMonitoringEnabled = false
        NotificationCenter.default.removeObserver(proximityObserver, name: UIDevice.proximityStateDidChangeNotification, object: UIDevice.current)
    }
// MARK: Circle Animation Part
    func calculateCircleSeconds() {
        var count = 0
            Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { timer in
                if count % 6 == 5 {
                    seconds -= 1
                    bar += 1
                    count = 0
                }
                count += 1
                if seconds < 0 {
                    timer.invalidate()
                }
            }
    }
    
    var body: some View {
        if seconds < 0 {
            ZStack {
                VStack {
                    VStack {
                        ExerciseHeaderView(secondsElapsed: 0, secondsRemaining: 0)
                        Text(exercise.goal)
                            .font(.system(size: 28))
                            .padding(.top)
                        Spacer()
                        Spacer()
                        Text("\(proximityObserver.count)")
                            .font(.system(size: 100))
                            .onAppear() {
                                self.activateProximitySensor()
                            } .onDisappear() {
                                self.deactivateProximitySensor()
                            }
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                    Spacer()
                }
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
                        .trim(from: 1 - CGFloat(bar) / 5, to: 1)
                        .stroke(Color.myGreen, style: StrokeStyle(lineWidth: 30))
                        .rotationEffect(.init(degrees: -90))
                        .animation(.easeIn, value: bar)
                        .padding(.init(top: 60, leading: 50, bottom: 50, trailing: 50))
                }
            }
            .onAppear {
                self.calculateCircleSeconds()
            }
        }
    }
}

struct ExerciseView_Previews: PreviewProvider {
    
    static var previews: some View {
        ExerciseView(exercise: Exercises().pushUp)
    }
}
