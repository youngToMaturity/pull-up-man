//
//  OnboardingPageView.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/05/24.
//

import SwiftUI

struct OnboardingPageView: View {
    var body: some View {
        VStack {
            Spacer()
            Spacer()
            Image("pull-up")
                .resizable()
                .frame(width: 150, height: 150)
                .cornerRadius(20)
                .padding()
            Text("Pull-Up-Man")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            Text("Welcome to Pull-Up-Man!\nYou can slide the screen to see the introduction of each tab")
                .font(.system(size: 20))
                .lineSpacing(10)
                .multilineTextAlignment(.center)
            Spacer()
            HStack {
                Image(systemName: "arrow.left.arrow.right")
                Text("Slide to the side")
            }
            Spacer()
        }
    }
}

struct OnboardingPageView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPageView()
    }
}
