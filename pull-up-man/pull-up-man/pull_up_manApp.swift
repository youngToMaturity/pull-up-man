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
        if userViewModel.isFirst {
            UserDefaults.standard.set([
                -1, -1, -1, -1, -1, -1, -1
            ], forKey: "pushup")
            UserDefaults.standard.set([
                -1, -1, -1, -1, -1, -1, -1
            ], forKey: "pullup")
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
