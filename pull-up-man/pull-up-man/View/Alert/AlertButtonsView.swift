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
    @State private var isAlert = true
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
                Button(action: {
                    print("Clicked")
                }) {
                    Text("Repeat")
                }
                .frame(width: 80, height: 40)
                .font(.system(size: 18))
                .foregroundColor(Color.white)
                .background(Color.myGreen)
                .cornerRadius(6.0)
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
            HStack {
                Text("sun")
                Text("mon")
                Text("tue")
                Text("wed")
                Text("thu")
                Text("fri")
                Text("sat")
            }
            Divider()
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
        AlertButtonsView(title: "Push Up Alert")
    }
}
