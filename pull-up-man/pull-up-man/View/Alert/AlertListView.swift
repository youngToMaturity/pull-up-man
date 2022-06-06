//
//  AlertListView.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/04/28.
//

import SwiftUI

struct AlertListView: View {
    let day: String
    @Binding var idx: Bool
    
    var body: some View {
        HStack {
            Button(action: {
                idx.toggle()
            }) {
                Text(LocalizedStringKey(day))
                    .frame(width: 180, alignment: .leading)
                Spacer()
            }
            .accentColor(Color.myBlack)
            if idx {
                Image(systemName: "checkmark")
                    .foregroundColor(Color.blue)
            }
        }
        Divider()
    }
}

struct AlertListView_Previews: PreviewProvider {
    static var previews: some View {
        AlertListView(day: "Monday", idx: .constant(false))
    }
}
