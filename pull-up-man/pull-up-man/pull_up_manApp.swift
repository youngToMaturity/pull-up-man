//
//  pull_up_manApp.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/01.
//

import SwiftUI

@main
struct pull_up_manApp: App {
    let persistenceController = PersistenceController.shared
    
    @StateObject var notification = NotificationViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(notification)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
