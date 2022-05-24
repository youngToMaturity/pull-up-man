//
//  AlertButtonsView.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/04/17.
//

import SwiftUI
import UserNotifications

struct AlertButtonsView: View {
    @EnvironmentObject var notification: NotificationViewModel
    @State private var currentDate = Date()
    @State private var isStrong = false
    @State private var isAlert = false
    @State private var repeatClicked = false
    @State var daySelected: [Bool]
    @State var alertTime: String = ""
    let df = DateFormatter()
    var title: String
    
    var body: some View {
        VStack {
            HStack {
                Text(LocalizedStringKey(title))
                    .font(.bold(.system(size: 20))())
                    .padding()
                    .padding(.leading)
                Spacer()
            }
            .onAppear {
                checkIsAlert()
                UNUserNotificationCenter.current().delegate = notification
                if title == "Push Up Alert" {
                    alertTime = UserDefaults.standard.string(forKey: "pushupTime") ?? ""
                } else {
                    alertTime = UserDefaults.standard.string(forKey: "pullupTime") ?? ""
                }
                if alertTime != "" {
                    let df2 = DateFormatter()
                    let df1 = DateFormatter()
                    df.dateFormat = "HH:mm"
                    df2.dateFormat = "YYYY-MM-dd "
                    df1.dateFormat = "YYYY-MM-dd HH:mm"
                    alertTime = df2.string(from: Date()) + alertTime
                    currentDate = df1.date(from: alertTime) ?? Date()
                }
            }
            HStack(alignment: .center) {
                DatePicker("", selection: $currentDate, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                    .scaleEffect(x: 1.2, y: 1.2)
                    .padding(.leading)
                    .padding(.leading)
                    .padding()
                    .onChange(of: currentDate, perform: { value in
                        updateAlertTime(value)
                    })
                if isAlert {
                    Button(action: {
                        withAnimation {
                            repeatClicked.toggle()}
                    }) {
                        Text("Repeat")
                    }
                    .frame(width: 80, height: 40)
                    .font(.system(size: 18))
                    .foregroundColor(Color.white)
                    .background(Color.myGreen)
                    .cornerRadius(6.0)
                } else {
                    Button(action: {
                        withAnimation {
                            repeatClicked.toggle()}
                    }) {
                        Text("Repeat")
                    }
                    .frame(width: 80, height: 40)
                    .font(.system(size: 18))
                    .foregroundColor(Color.white)
                    .background(Color.gray)
                    .cornerRadius(6.0)
                }
                if isStrong {
                    strongButton
                        .background(Color.myGreen)
                        .cornerRadius(6.0)
                        .hidden()
                } else {
                    strongButton
                        .background(Color.gray)
                        .cornerRadius(6.0)
                        .hidden()
                }
                Spacer()
            }
            if repeatClicked {
                ScrollView {
                    VStack(alignment: .leading) {
                        AlertListView(day: "Monday", idx: $daySelected[1])
                        AlertListView(day: "Tuesday", idx: $daySelected[2])
                        AlertListView(day: "Wednesday", idx: $daySelected[3])
                        AlertListView(day: "Thursday", idx: $daySelected[4])
                        AlertListView(day: "Friday", idx: $daySelected[5])
                        AlertListView(day: "Saturday", idx: $daySelected[6])
                        AlertListView(day: "Sunday", idx: $daySelected[0])
                    }
                }
                .padding(.leading)
                .padding(.trailing)
                .padding(.leading)
                .padding(.trailing)
                .padding()
                .onDisappear {
                    checkIsAlert()
                    if title == "Push Up Alert" {
                        UserDefaults.standard.set(daySelected, forKey: "pushup")
                        if isAlert {
                            setAlert("pushup")
                        }
                    } else {
                        UserDefaults.standard.set(daySelected, forKey: "pullup")
                        if isAlert {
                            setAlert("pullup")
                        }
                    }
                }
            }
            HStack(spacing: 20) {
                AlertDayView(state: daySelected[1], day: "mon")
                AlertDayView(state: daySelected[2], day: "tue")
                AlertDayView(state: daySelected[3], day: "wed")
                AlertDayView(state: daySelected[4], day: "thu")
                AlertDayView(state: daySelected[5], day: "fri")
                AlertDayView(state: daySelected[6], day: "sat")
                AlertDayView(state: daySelected[0], day: "sun")
            }
            Divider()
        }
    }
    
    func checkIsAlert() {
        isAlert = false
        for state in daySelected {
            if state {
                isAlert = true
            }
        }
    }
    
    func updateAlertTime(_ value: Date) {
        df.dateFormat = "HH:mm"
        if title == "Push Up Alert" {
            UserDefaults.standard.set(df.string(from: value), forKey: "pushupTime")
        } else {
            UserDefaults.standard.set(df.string(from: value), forKey: "pullupTime")
        }
    }
    
    func setAlert(_ workOut: String) {
        let current = UNUserNotificationCenter.current()
        let df1 = DateFormatter()
        df1.dateFormat = "HH"
        let hour = Int(df1.string(from: currentDate))!
        df1.dateFormat = "mm"
        let minute = Int(df1.string(from: currentDate))!
        if workOut == "pushup" {
            var weekday = 0
            current.removePendingNotificationRequests(withIdentifiers: ["pushupAlert0", "pushupAlert1", "pushupAlert2", "pushupAlert3", "pushupAlert4", "pushupAlert5", "pushupAlert6"])
            while weekday < 7 {
                if daySelected[weekday] {
                    var dateComponents = DateComponents()
                    dateComponents.calendar = Calendar.current
                    dateComponents.weekday = weekday + 1
                    dateComponents.hour = hour
                    dateComponents.second = 0
                    dateComponents.minute = minute
                    dateComponents.timeZone = TimeZone.current
                    let content = UNMutableNotificationContent()
                    content.title = NSLocalizedString("Time to push up🔥", comment: "")
                    content.body = NSLocalizedString("You can do it! Cheer up!⚡️", comment: "")
                    content.sound = UNNotificationSound.default
                    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
                    let id = "pushupAlert" + String(weekday)
                    let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
                    current.add(request) { (error) in
                        if error != nil {
                            print(error!.localizedDescription)
                        }
                    }
                }
                weekday += 1
            }
        } else {
            var weekday = 0
            current.removePendingNotificationRequests(withIdentifiers: ["pullupAlert0","pullupAlert1","pullupAlert2","pullupAlert3","pullupAlert4","pullupAlert5","pullupAlert6"])
            while weekday < 7 {
                if daySelected[weekday] {
                    var dateComponents = DateComponents()
                    dateComponents.calendar = Calendar.current
                    dateComponents.weekday = weekday + 1
                    dateComponents.hour = hour
                    dateComponents.minute = minute
                    dateComponents.second = 0
                    dateComponents.timeZone = TimeZone.current
                    let content = UNMutableNotificationContent()
                    content.title = NSLocalizedString("Time to push up🔥", comment: "")
                    content.body = NSLocalizedString("You can do it! Cheer up!⚡️", comment: "")
                    content.sound = UNNotificationSound.default
                    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
                    let id = "pullupAlert" + String(weekday)
                    let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
                    current.add(request) { (error) in
                        if error != nil {
                            print(error!.localizedDescription)
                        }
                    }
                }
                weekday += 1
            }
        }
//        var text:NSMutableAttributedString? = NSMutableAttributedString(string: "\nList of notification requests and it's time\n")
//
//        UNUserNotificationCenter.current().getPendingNotificationRequests() {  requests in
//            DispatchQueue.main.async {
//                for request in requests {
//                    guard let trigger = request.trigger as? UNCalendarNotificationTrigger else { return }
//                    text?.append(NSAttributedString(string: "\nTrigger Date:\(trigger.nextTriggerDate()?.description ?? "none") \nDateTime Component:\(trigger.dateComponents.description)\n"))
//                }
//                print(text)
//            }
//        }
    }
    
    var strongButton: some View {
        Button(action: {
            isStrong.toggle()
        }) {
            Text("Strong")
        }
        .frame(width: 80, height: 40)
        .font(.system(size: 18))
        .foregroundColor(Color.white)
    }
}

struct AlertButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        AlertButtonsView(daySelected: [false, false, false, false, false, false, false], title: "Push Up Alert")
            .environmentObject(NotificationViewModel())
    }
}

