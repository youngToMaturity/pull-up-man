//
//  test.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/01.
//

import SwiftUI

struct test: View {
//    var proximityObserver = ExerciseViewModel()
//    func activateProximitySensor() {
//        UIDevice.current.isProximityMonitoringEnabled = true
//        if UIDevice.current.isProximityMonitoringEnabled {
//            NotificationCenter.default.addObserver(proximityObserver, selector: #selector(proximityObserver.didChange), name: UIDevice.proximityStateDidChangeNotification, object: UIDevice.current)
//        }
//    }
//
//    func deactivateProximitySensor() {
//        print("MyView::deactivateProximitySensor")
//        UIDevice.current.isProximityMonitoringEnabled = false
//        NotificationCenter.default.removeObserver(proximityObserver, name: UIDevice.proximityStateDidChangeNotification, object: UIDevice.current)
//    }

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .onAppear() {
//                self.activateProximitySensor()
//            } .onDisappear() {
//                self.deactivateProximitySensor()
//            }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
