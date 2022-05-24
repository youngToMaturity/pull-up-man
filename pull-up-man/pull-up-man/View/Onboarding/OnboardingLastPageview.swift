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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                isFirstMain.toggle()
            }
    }
}

struct OnboardingLastPageview_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingLastPageview(isFirstMain: .constant(true))
    }
}
