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
            Text("모든 준비가 끝났습니다!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            Text("철봉왕이 되는 그날까지!\n여정을 시작해보세요")
                .font(.system(size: 20))
                .lineSpacing(10)
                .multilineTextAlignment(.center)
            Spacer()
            Button(action: {
                isFirstMain.toggle()
            }) {
                Text("시작하기")
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
