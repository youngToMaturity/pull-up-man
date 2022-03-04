//
//  test.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/01.
//

import SwiftUI

struct test: View {
    @ObservedObject var vm = ExerciseViewModel()
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                vm.testMain()
            }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
