//
//  test.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/01.
//

import SwiftUI

struct test: View {
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        VStack {
            Text("Hello, \(userViewModel.nickname)!")
                .font(.bold(.system(size: 28))())
            Text("Comming Soon!")
                .font(.subheadline)
        }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
            .environmentObject(UserViewModel("8880CD65-302C-4C57-AA26-421AEFC9456C"))
    }
}
