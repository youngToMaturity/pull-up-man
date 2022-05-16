//
//  pull_up_manApp.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/01.
//

import SwiftUI
import Firebase

@main
struct pull_up_manApp: App {
    let persistenceController = PersistenceController.shared
    
    @StateObject var userViewModel = UserViewModel(UIDevice.current.identifierForVendor!.uuidString)
    @StateObject var notification = NotificationViewModel()
    
    init() {
        FirebaseApp.configure() // 코드 추가
        if UserDefaults.standard.array(forKey: "pushup") == nil {
            UserDefaults.standard.set([
                false, false, false, false, false, false, false
            ], forKey: "pushup")
        }
        if UserDefaults.standard.string(forKey: "pushupTime") == nil {
            UserDefaults.standard.set("", forKey: "pushupTime")
        }
        if UserDefaults.standard.array(forKey: "pullup") == nil {
            UserDefaults.standard.set([
                false, false, false, false, false, false, false
            ], forKey: "pullup")
        }
        if UserDefaults.standard.string(forKey: "pullupTime") == nil {
            UserDefaults.standard.set("", forKey: "pullupTime")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            if userViewModel.isFirst {
                FirstView()
                    .environmentObject(userViewModel)
            } else {
                MainView()
                    .environmentObject(notification)
                    .environmentObject(userViewModel)
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
        }
    }
}

extension Color {
    static let myWhite = Color("MyWhite")
    static let myGreen = Color("MyGreen")
    static let myBlack = Color("MyBlack")
}
