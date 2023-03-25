//
//  FirstView.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/24.
//

import SwiftUI

struct FirstView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @Binding var isFirstMain: Bool
    @State var nickname: String = ""
    @State var age: String = ""
    let counts = ["0","1","2","3","4","5","6","7","8","9","10"]
    @State var selectedCount = "0"
    @State var isInvalidNickname = false
    @State var isInvalidAge = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Let me know yourself!")
                    .font(.bold(.system(size: 28))())
                    .padding(.init(top: 10, leading: 0, bottom: 30, trailing: 0))
                VStack(alignment: .leading) {
                    Text("How should i call you?")
                        .font(.subheadline)
                    TextField("Nickname", text: $nickname)
                        .disableAutocorrection(true)
                    if isInvalidNickname {
                        Text("Nickname is Necessary")
                            .font(.subheadline)
                            .foregroundColor(Color.red)
                    }
                }
                Divider()
                    .padding(.init(top: 1, leading: 0, bottom: 20, trailing: 0))
                HStack {
                    Text("How old are you?")
                        .font(.subheadline)
                    Spacer()
                    TextField("Age", text: $age)
                        .keyboardType(.decimalPad)
                        .disableAutocorrection(true)
                }
                if isInvalidAge {
                    Text("Age is Necessary")
                        .font(.subheadline)
                        .foregroundColor(Color.red)
                }
                Divider()
                    .padding(.init(top: 1, leading: 0, bottom: 20, trailing: 0))
                VStack(alignment: .leading) {
                    Text("How many pull-ups you can do 1RM?")
                        .font(.subheadline)
                        .padding(.bottom)
                    Text("Pick 0 if you don't know,\nPick 10 if you can do over 10")
                        .font(.caption)
                    Picker(selection: $selectedCount, label: Text("")) {
                        ForEach(0 ..< counts.count, id:\.self) {
                            Text(self.counts[$0])
                        }
                    }
                    .pickerStyle(.wheel)
                }
                Spacer()
            }
            .padding(.init(top: 10, leading: 10, bottom: 50, trailing: 0))
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
            Spacer()
            Button(action: {
                if nickname != "" && age != "" {
                    isInvalidNickname = false
                    isInvalidAge = false
                    Task {
                        await userViewModel.updateInfo(nickname, age, selectedCount)
                    }
                    isFirstMain = true
                } else {
                    if nickname == "" {
                        isInvalidNickname = true
                    }
                    if age == "" {
                        isInvalidAge = true
                    }
                }
            }) {
                Text("Submit")
            }
            .frame(width: 230, height: 45)
            .font(.system(size: 18))
            .foregroundColor(Color.white)
            .background(Color.myGreen)
            .cornerRadius(6.0)
            .padding(.bottom)
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView(isFirstMain: .constant(false))
            .environment(\.locale, .init(identifier: "ko"))
    }
}
