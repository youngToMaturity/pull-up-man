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
    
    @ObservedObject var pullUpViewModel: PullUpViewModel
    
    @State var isPeakSet = false
    
    var backButton: some View {
        HStack {
            Image(systemName: "xmark")
            Text("Stop Work Out")
        }
        .foregroundColor(.myGreen)
        .onTapGesture {
            pullUpViewModel.finishWorkOut()
            self.presentation.wrappedValue.dismiss()
        }
    }
    
    var body: some View {
        VStack {
            PullUpHeaderView(pullUpViewModel: pullUpViewModel)
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
            Text("\(pullUpViewModel.count)")
                .font(.system(size: 80))
            Spacer()
            PullUpButtonsView(isPeakSet: $isPeakSet, pullUpViewModel: pullUpViewModel, routine: routine)
            Spacer()
        }
        .navigationBarTitle(Text(""), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:backButton)
    }
}

struct PullUpView_Previews: PreviewProvider {
    static var previews: some View {
        PullUpView(routine: Exercises().pullUp[0], pullUpViewModel: PullUpViewModel(Exercises().pullUp[0].term))
            .environment(\.locale, .init(identifier: "ko"))
        PullUpView(routine: Exercises().pullUp[0], pullUpViewModel: PullUpViewModel(Exercises().pullUp[0].term))
            .preferredColorScheme(.dark)
    }
}
