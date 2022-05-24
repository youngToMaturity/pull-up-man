//
//  OnboardingTabView.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/05/24.
//

import SwiftUI

struct OnboardingTabView: View {
    @Binding var isFirstMain: Bool
    var body: some View {
        TabView {
            OnboardingPageView()
            OnboardingPageView()
            OnboardingLastPageview(isFirstMain: $isFirstMain)
        }
        .tabViewStyle(.page)
    }
}

struct OnboardingTabView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingTabView(isFirstMain: .constant(true))
    }
}
