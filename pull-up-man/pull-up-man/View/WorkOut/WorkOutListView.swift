//
//  WorkOutListView.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/01.
//

import SwiftUI

struct WorkOutListView: View {
    let exercise: Exercise
    
    var body: some View {
        HStack(alignment: .top) {
            if exercise.id == 0 {
                exercise.image
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    .frame(width: 80, height: 80)
                    .background(Color.myGreen)
                    .cornerRadius(10)
            } else {
                exercise.image
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 80, height: 80)
                    .aspectRatio(contentMode: .fit)
                    .background(Color.myGreen)
                    .cornerRadius(10)
            }
            VStack(alignment: .leading) {
                HStack {
                    Text(exercise.goal)
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                    Spacer()
                    if exercise.term > 0 {
                        Text("\(String(exercise.term))s")
                            .font(.system(size: 13))
                    } else {
                        Text("N secs")
                            .font(.system(size: 13))
                    }
                }
                Text(exercise.description)
                    .font(.system(size: 13))
            }
        }
        .frame(height: 100)
    }
    
}

struct WorkOutListView_Previews: PreviewProvider {
    static var previews: some View {
        WorkOutListView(exercise: Exercises().pushUp)
            .environment(\.locale, .init(identifier: "ko"))
        WorkOutListView(exercise: Exercises().pullUp[1])
            .preferredColorScheme(.dark)
    }
}
