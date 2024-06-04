//
//  Complication.swift
//  Complication
//
//  Created by GABRIEL Ferreira Cardoso on 04/06/24.
//

import SwiftUI
import WidgetKit

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let entries: [SimpleEntry] = [SimpleEntry(date: Date())]
        // No need update timeline
        let timeline = Timeline(entries: entries, policy: .never)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct ComplicationWidgetEntryView: View {
    @Environment(\.widgetRenderingMode) var renderingMode
    var entry: Provider.Entry
    
    var body: some View {
        if renderingMode == .fullColor {
            Image("Image")
                .resizable()
                .scaledToFit()
        } else {
            Image("Image")
                .resizable()
                .scaledToFit()
                .widgetAccentable()
        }
    }
}

@main
struct ComplicationWidget: Widget {
    let kind: String = "FuncionouÉIsso"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(watchOS 10.0, *) {
                ComplicationWidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                ComplicationWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("Complication sample")
        .description("Teste")
        .supportedFamilies([.accessoryCircular])
    }

        
    
}

#Preview (as: .accessoryRectangular) {
    ComplicationWidget()
} timeline: {
    SimpleEntry(date: .now)
}

