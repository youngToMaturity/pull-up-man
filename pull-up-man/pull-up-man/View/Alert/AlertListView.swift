//
//  AlertListView.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/04/28.
//

import SwiftUI

struct AlertListView: View {
    let day: String
    
    var body: some View {
        HStack {
            Button(action: {
                
            }) {
                Text(day)
                    .frame(width: 180, height: 30, alignment: .leading)
            }
            .accentColor(Color.myBlack)
            Spacer()
            Text("✔")
                .foregroundColor(Color.myBlack)
        }
        Divider()
    }
}

struct AlertListView_Previews: PreviewProvider {
    static var previews: some View {
        AlertListView(day: "Monday")
    }
}
