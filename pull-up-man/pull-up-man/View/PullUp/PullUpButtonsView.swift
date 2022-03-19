//
//  PullUpButtonsView.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/18.
//

import SwiftUI

struct PullUpButtonsView: View {
    @Binding var someToggle: Bool
    @Binding var isToggle: Int
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                minusButton
                Spacer()
                plusButton
                Spacer()
            }
            .padding()
            VStack(alignment: .center) {
                HStack {
                    Text("Peak set")
                    Toggle("", isOn: $someToggle)
                        .toggleStyle(SwitchToggleStyle(tint: Color.myGreen))
                }
                .frame(width: 150, height: 45, alignment: .center)
                .opacity(Double(isToggle))
                Button(action: {
                    
                }) {
                    Text("Finish Set")
                }
                .frame(width: 230, height: 45)
                .font(.system(size: 18))
                .foregroundColor(Color.white)
                .background(Color.myGreen)
                .cornerRadius(6.0)
            }
        }
    }
    
}

var plusButton: some View {
    Button(action: {
        
    }) {
        Image(systemName: "plus")
    }
    .frame(width: 45, height: 45)
    .font(.system(size: 30))
    .foregroundColor(Color.white)
    .background(Color.myGreen)
    .cornerRadius(6.0)
    .clipShape(Circle())
}

var minusButton: some View {
    Button(action: {
        
    }) {
        Image(systemName: "minus")
    }
    .frame(width: 45, height: 45)
    .font(.system(size: 30))
    .foregroundColor(Color.white)
    .background(Color.red)
    .cornerRadius(6.0)
    .clipShape(Circle())
}

struct PullUpButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        PullUpButtonsView(someToggle: .constant(true), isToggle: .constant(1))
    }
}
