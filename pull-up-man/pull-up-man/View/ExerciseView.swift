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
    
    var body: some View {
        VStack {
            VStack {
                Text(exercise.goal)
                    .font(.system(size: 28))
                Text(exercise.description)
                    .padding()
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
            }
            Spacer()
        }
    }
}

struct ExerciseView_Previews: PreviewProvider {
    
    static var previews: some View {
        ExerciseView(exercise: Exercises().pushUp)
    }
}
