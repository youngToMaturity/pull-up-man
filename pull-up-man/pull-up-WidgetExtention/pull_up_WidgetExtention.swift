//
//  pull_up_WidgetExtention.swift
//  pull-up-WidgetExtention
//
//  Created by Young Soo Hwang on 2023/01/14.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct pull_up_WidgetExtentionEntryView : View {
    var entry: Provider.Entry

    @Environment(\.widgetFamily) var family

    @ViewBuilder
    var body: some View {
        switch family {
        case .systemSmall:
            ZStack {
                Color("MyGreen")
                VStack {
                    Image("pull-up_png")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .colorInvert()
                }
            }
        case .accessoryCircular:
                ZStack {
                    AccessoryWidgetBackground()
                        .foregroundColor(Color("MyGreen"))
                    HStack {
                        Image("pull-up_png")
                            .resizable()
                            .padding(10)
                            .colorInvert()
                    }
                }
        default:
            HStack {
                Image("pull-up_png")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .colorInvert()
            }
        }
    }
}

struct pull_up_WidgetExtention: Widget {
    let kind: String = "pull_up_WidgetExtention"

    var supportedFamily: [WidgetFamily] {
        if #available(iOS 16.0, *) {
            return [WidgetFamily.systemSmall, WidgetFamily.accessoryCircular]
        } else {
            return [WidgetFamily.systemSmall]
        }
    }

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            pull_up_WidgetExtentionEntryView(entry: entry)
        }
        .supportedFamilies(supportedFamily)
        .configurationDisplayName("Pull-Up-Man")
        .description("Tap to start Today's workout immediately.")
    }
}

struct pull_up_WidgetExtention_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            pull_up_WidgetExtentionEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
                .previewContext(WidgetPreviewContext(family: .systemSmall))

            pull_up_WidgetExtentionEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
                .previewContext(WidgetPreviewContext(family: .accessoryCircular))
        }
    }
}
