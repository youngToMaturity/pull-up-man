//
//  PullUpView.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/17.
//

import SwiftUI

struct PullUpView: View {
    let routine: Exercise
    
    @Environment(\.presentationMode) var presentation
    
    var backButton: some View {
        HStack {
            Image(systemName: "xmark")
            Text("Stop Work Out")
        }
        .foregroundColor(.myGreen)
        .onTapGesture {
            self.presentation.wrappedValue.dismiss()
        }
    }
    
    var body: some View {
        VStack {
            PullUpHeaderView(term: routine.term)
                .padding(.bottom)
            VStack {
                Text(routine.goal)
                    .font(.title)
                Text(routine.description)
                    .font(.caption)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            Spacer()
            Text("0")
                .font(.system(size: 80))
            Spacer()
            PullUpButtonsView()
            Spacer()
        }
        .navigationBarTitle(Text(""), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:backButton)
    }
}

struct PullUpView_Previews: PreviewProvider {
    static var previews: some View {
        PullUpView(routine: Exercises().pullUp[1])
            .environment(\.locale, .init(identifier: "ko"))
        PullUpView(routine: Exercises().pullUp[1])
            .preferredColorScheme(.dark)
    }
}
