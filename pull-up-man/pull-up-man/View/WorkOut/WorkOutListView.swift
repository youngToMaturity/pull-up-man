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
                    .font(.system(size: 60))
                    .foregroundColor(.white)
                    .frame(width: 100, height: 100)
                    .background(Color.myGreen)
                    .cornerRadius(10)
            } else {
                exercise.image
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 100, height: 100)
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
                    if exercise.id == 2 {
                        Text("N secs")
                            .font(.system(size: 13))
                    } else{
                        Text("\(String(exercise.term))s")
                            .font(.system(size: 13))
                    }
                }
                Text(exercise.description)
                    .font(.system(size: 13))
            }
        }
        .frame(height: 120)
    }
    
}

struct WorkOutListView_Previews: PreviewProvider {
    static var previews: some View {
        WorkOutListView(exercise: Exercises().pushUp)
            .environment(\.locale, .init(identifier: "ko"))
        WorkOutListView(exercise: Exercises().pullUp[2])
            .preferredColorScheme(.dark)
    }
}
