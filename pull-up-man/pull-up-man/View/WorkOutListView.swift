//
//  WorkOutListView.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/01.
//

import SwiftUI

struct WorkOutListView: View {
    var body: some View {
        HStack {
            Image("pull-up")
                .resizable()
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .aspectRatio(contentMode: .fit)
                .background(Color.myGreen)
                .cornerRadius(10)
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Open Goal")
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                    Text("Did 24 push-ups before")
                        .font(.system(size: 13))
                }
                Text("30s")
                    .font(.system(size: 13))
            }
        }
        .frame(height: 60)
    }
    
}

struct WorkOutListView_Previews: PreviewProvider {
    static var previews: some View {
        WorkOutListView()
            .environment(\.locale, .init(identifier: "ko"))
        WorkOutListView()
            .preferredColorScheme(.dark)
    }
}
