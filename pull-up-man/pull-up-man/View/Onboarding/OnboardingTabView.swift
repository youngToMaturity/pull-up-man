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
            OnboardingTabPageView(image: "flame.fill", title: "Work out", description: "Composed of Push-up and Pull-up\nPush-up runs every morning\nPull-up runs in the routine of\neach day of the week\nAfter you finish exercising,\ntap Finish Exercise to record!")
            OnboardingTabPageView(image: "alarm.fill", title: "Alert", description: "Set push-up and pull-up notifications\nIf you select the desired day and time,\n you will be notified\nwhen the conditions are met\nDo exercise on time for notification!")
            OnboardingTabPageView(image: "chart.bar.fill", title: "Chart", description: "Chart tab is being prepared\nYou can check the exercise records of\neach event at a glance\nWe'll be back soon!")
            OnboardingTabPageView(image: "gearshape.fill", title: "Setting", description: "Setting tab allows you to set\npermission to receive notifications\nand re-view how to use\nLink to developer's github and blog\nYou can report inquiries or errors\nThere is also email and Instagram!")
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
