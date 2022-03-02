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
            Image(systemName: "flame.fill")
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(.green)
                .cornerRadius(10)
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Open Goal")
                        .fontWeight(.semibold)
                    Text("Did 24 push-ups before")
                        .font(.system(size: 13))
                }
                Text("30s")
            }
        }
        .frame(height: 60)
    }
    
}

struct WorkOutListView_Previews: PreviewProvider {
    static var previews: some View {
        WorkOutListView()
    }
}
