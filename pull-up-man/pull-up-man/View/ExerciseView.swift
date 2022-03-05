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
        UIDevice.current.isProximityMonitoringEnabled = true
        if UIDevice.current.isProximityMonitoringEnabled {
            NotificationCenter.default.addObserver(proximityObserver, selector: #selector(proximityObserver.didChange), name: UIDevice.proximityStateDidChangeNotification, object: UIDevice.current)
        }
    }
    
    func deactivateProximitySensor() {
        print("MyView::deactivateProximitySensor")
        UIDevice.current.isProximityMonitoringEnabled = false
        NotificationCenter.default.removeObserver(proximityObserver, name: UIDevice.proximityStateDidChangeNotification, object: UIDevice.current)
    }
    
    var body: some View {
        VStack {
            VStack {
                Text(exercise.goal)
                    .font(.system(size: 28))
                    .padding()
                Text(exercise.description)
                    .padding()
                Spacer()
                Text("\(proximityObserver.count)")
                    .font(.system(size: 100))
                    .padding()
                    .onAppear() {
                        self.activateProximitySensor()
                    } .onDisappear() {
                        self.deactivateProximitySensor()
                    }
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
