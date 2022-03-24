//
//  FirstView.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/24.
//

import SwiftUI

struct FirstView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        ScrollView {
            Text("Hello World!")
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
