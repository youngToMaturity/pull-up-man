//
//  PullUpButtonsView.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/18.
//

import SwiftUI

struct PullUpButtonsView: View {
    @Binding var isPeakSet: Bool
    @Binding var count: Int
    
    @ObservedObject var pullUpViewModel: PullUpViewModel
    
    var routine: Exercise
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                // minus button
                Button(action: {
                    if count > 0 {
                        count -= 1
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
                Spacer()
                // plusButton
                Button(action: {
                    count += 1
                }) {
                    Image(systemName: "plus")
                }
                .frame(width: 45, height: 45)
                .font(.system(size: 30))
                .foregroundColor(Color.white)
                .background(Color.myGreen)
                .cornerRadius(6.0)
                .clipShape(Circle())
                Spacer()
            }
            .padding()
            
            VStack(alignment: .center) {
                HStack {
                    if routine.id == 2 {
                        Text("Peak Set")
                        Toggle("", isOn: $isPeakSet)
                            .toggleStyle(SwitchToggleStyle(tint: Color.myGreen))
                    } else {
                        Text("Goal Set")
                        Text("\(String(routine.goalSet))")
                    }
                }
                .frame(width: 150, height: 45, alignment: .center)
                
                Button(action: {
                    pullUpViewModel.finishSet(routine.id)
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
}

struct PullUpButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        PullUpButtonsView(isPeakSet: .constant(false), count: .constant(10), pullUpViewModel:PullUpViewModel(Exercises().pullUp[0].term), routine: Exercises().pullUp[0])
    }
}
