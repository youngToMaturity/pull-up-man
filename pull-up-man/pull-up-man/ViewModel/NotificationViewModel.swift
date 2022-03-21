//
//  TimerViewModel.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/21.
//

import Foundation
import UserNotifications

class NotificationViewModel: NSObject,UNUserNotificationCenterDelegate ,ObservableObject {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound])
    }
}
