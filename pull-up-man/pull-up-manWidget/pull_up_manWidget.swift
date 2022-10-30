//
//  pull_up_manWidget.swift
//  pull-up-manWidget
//
//  Created by Young Soo Hwang on 2022/09/24.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}


struct pull_up_manWidgetEntryView : View {
    let screenWidth = {
        switch UIScreen.main.bounds.size {
        case CGSize(width: 428, height: 926):   return 170
        case CGSize(width: 414, height: 896):   return 169
        case CGSize(width: 414, height: 736):   return 159
        case CGSize(width: 390, height: 844):   return 158
        case CGSize(width: 375, height: 812):   return 155
        case CGSize(width: 375, height: 667):   return 148
        case CGSize(width: 360, height: 780):   return 155
        case CGSize(width: 320, height: 568):   return 141
        default:                                return 155
        }
    }

    var entry: Provider.Entry

    var body: some View {
        ZStack {
            Color("WidgetBackground")
            Image("pull-up-man-white")
                .resizable()
                .frame(width: CGFloat(screenWidth() / 2), height: CGFloat(screenWidth() / 2))
        }
    }
}

@main
struct pull_up_manWidget: Widget {
    let kind: String = "pull_up_manWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            pull_up_manWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct pull_up_manWidget_Previews: PreviewProvider {
    static var previews: some View {
        pull_up_manWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
            .preferredColorScheme(.dark)
    }
}
