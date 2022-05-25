//
//  OnboardingTabPageView.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/05/25.
//

import SwiftUI

struct OnboardingTabPageView: View {
    let image: String
    let title: LocalizedStringKey
    let description: LocalizedStringKey
    var body: some View {
        VStack {
            Image(systemName: image)
                .foregroundColor(.myGreen)
                .font(.system(size: 100))
                .padding()
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            Text(description)
                .font(.system(size: 17))
                .lineSpacing(10)
                .multilineTextAlignment(.center)
        }
    }
}

//struct OnboardingTabPageView_Previews: PreviewProvider {
//    static var previews: some View {
//        OnboardingTabPageView()
//    }
//}
