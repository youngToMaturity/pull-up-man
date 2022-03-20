//
//  PullUpButtonsView.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/18.
//

import SwiftUI

struct PullUpButtonsView: View {
    @Binding var isPeakSet: Bool
    
    @ObservedObject var pullUpViewModel: PullUpViewModel
    
    var routine: Exercise
    
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
                    if routine.id == 2 {
                        Text("Peak Set")
                        Toggle("", isOn: $isPeakSet)
                            .toggleStyle(SwitchToggleStyle(tint: Color.myGreen))
                            .disabled(pullUpViewModel.wasPeakSet)
                    } else {
                        VStack(alignment: .leading) {
                            Text("Goal Set")
                            Text("Total Count")
                        }
                        VStack {
                            Text(": \(String(routine.goalSet))")
                            Text(": \(String(pullUpViewModel.totalCount))")
                        }
                    }
                }
                .frame(width: 150, height: 45, alignment: .center)
                Button(action: {
                    pullUpViewModel.finishSet(routine.id, isPeakSet)
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
    
    var minusButton: some View {
        Button(action: {
            if pullUpViewModel.count > 0 {
                pullUpViewModel.count -= 1
            }
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
    
    var plusButton: some View {
        Button(action: {
            pullUpViewModel.count += 1
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
}

struct PullUpButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        PullUpButtonsView(isPeakSet: .constant(false), pullUpViewModel:PullUpViewModel(Exercises().pullUp[1].term), routine: Exercises().pullUp[1])
    }
}
