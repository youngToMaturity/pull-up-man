//
//  AlertButtonsView.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/04/17.
//

import SwiftUI

struct AlertButtonsView: View {
    @EnvironmentObject var notification: NotificationViewModel
    @State private var currentDate = Date()
    @State private var isStrong = false
    @State private var isAlert = false
    @State private var repeatClicked = false
    @State var daySelected: [Bool]
    
    var title: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.bold(.system(size: 20))())
                    .padding()
                    .padding(.leading)
                Spacer()
            }
            HStack(alignment: .center) {
                DatePicker("", selection: $currentDate, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                    .scaleEffect(x: 1.2, y: 1.2)
                    .padding(.leading)
                    .padding(.leading)
                    .padding()
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
                        AlertListView(day: "Monday", idx: $daySelected[0])
                        AlertListView(day: "Tuesday", idx: $daySelected[1])
                        AlertListView(day: "Wednesday", idx: $daySelected[2])
                        AlertListView(day: "Thursday", idx: $daySelected[3])
                        AlertListView(day: "Friday", idx: $daySelected[4])
                        AlertListView(day: "Saturday", idx: $daySelected[5])
                        AlertListView(day: "Sunday", idx: $daySelected[6])
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
                    } else {
                        UserDefaults.standard.set(daySelected, forKey: "pullup")
                    }
                }
            }
            HStack {
                AlertDayView(state: daySelected[6], day: "sun")
                AlertDayView(state: daySelected[0], day: "mon")
                AlertDayView(state: daySelected[1], day: "tue")
                AlertDayView(state: daySelected[2], day: "wed")
                AlertDayView(state: daySelected[3], day: "thu")
                AlertDayView(state: daySelected[4], day: "fri")
                AlertDayView(state: daySelected[5], day: "sat")
            }
            .onAppear {
                checkIsAlert()
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
    }
}
