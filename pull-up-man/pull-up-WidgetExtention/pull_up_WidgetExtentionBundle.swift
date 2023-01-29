//
//  pull_up_WidgetExtentionBundle.swift
//  pull-up-WidgetExtention
//
//  Created by Young Soo Hwang on 2023/01/14.
//

import WidgetKit
import SwiftUI

@main
struct pull_up_WidgetExtentionBundle: WidgetBundle {
    var body: some Widget {
        pull_up_WidgetExtention()
        if #available(iOS 16.2, *) {
            pull_up_WidgetExtentionLiveActivity()
        }
    }
}
