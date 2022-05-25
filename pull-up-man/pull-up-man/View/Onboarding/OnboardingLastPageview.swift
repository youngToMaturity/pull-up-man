//
//  OnboardingLastPageview.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/05/24.
//

import SwiftUI

struct OnboardingLastPageview: View {
    @Binding var isFirstMain: Bool
    var body: some View {
        VStack {
            Spacer()
            Spacer()
            Image(systemName: "bolt.fill")
                .foregroundColor(.myGreen)
                .font(.system(size: 100))
                .padding()
            Text("Everything is ready!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            Text("Until the day you become\nan iron bar king!\nStart your journey")
                .font(.system(size: 20))
                .lineSpacing(10)
                .multilineTextAlignment(.center)
            Spacer()
            Button(action: {
                isFirstMain.toggle()
            }) {
                Text("Get started")
            }
            .frame(width: 230, height: 45)
            .font(.system(size: 18))
            .foregroundColor(Color.white)
            .background(Color.myGreen)
            .cornerRadius(10)
            Spacer()
        }
    }
}

struct OnboardingLastPageview_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingLastPageview(isFirstMain: .constant(true))
    }
}
