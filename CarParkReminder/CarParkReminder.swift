//
//  CarParkReminder.swift
//  CarParkReminder
//
//  Created by BAHATTIN KOC on 27.05.2024.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    @AppStorage("activeParkAreaCode", store: UserDefaults(suiteName: "group.carrem"))
    var parkAreaCode: String = ""

    func placeholder(in context: Context) -> ParkAreaCodeEntry {
        ParkAreaCodeEntry(date: Date(), parkAreaCode: "C16", configuration: ConfigurationAppIntent())
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> ParkAreaCodeEntry {
        ParkAreaCodeEntry(date: Date(), parkAreaCode: "C16", configuration: configuration)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<ParkAreaCodeEntry> {
        let entries: [ParkAreaCodeEntry] = [ParkAreaCodeEntry(date: Date(), parkAreaCode: parkAreaCode, configuration: configuration)]
        return Timeline(entries: entries, policy: .atEnd)
    }
}

struct ParkAreaCodeEntry: TimelineEntry {
    let date: Date
    let parkAreaCode: String
    let configuration: ConfigurationAppIntent
}

struct CarParkReminderEntryView : View {
    @Environment(\.widgetFamily) var widgetFamily
    var entry: ParkAreaCodeEntry

    var body: some View {
        switch widgetFamily {
        case .accessoryCircular:
            VStack {
                if entry.parkAreaCode.isEmpty {
                    Text("NO\nPARK")
                        .bold()
                        .multilineTextAlignment(.center)
                } else {
                    Image(systemName: "car.fill")
                        .padding(.bottom, 2.0)
                        .font(.system(size: 16.0, weight: .black))
                    Text(entry.parkAreaCode)
                        .fontWeight(.heavy)
                        .fixedSize()
                        .multilineTextAlignment(.center)
                }
            }
        default:
            Text("Not implemented")
        }
    }

}

struct CarParkReminder: Widget {
    let kind: String = "CarParkReminder"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            CarParkReminderEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .configurationDisplayName("Car Park Reminder")
        .description("This is a reminder widget for your car park area code.")
        .supportedFamilies([.accessoryCircular])
    }
}

extension ConfigurationAppIntent {
    fileprivate static var smiley: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "😀"
        return intent
    }
    
    fileprivate static var starEyes: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "🤩"
        return intent
    }
}

#Preview(as: .accessoryCircular) {
    CarParkReminder()
} timeline: {
    ParkAreaCodeEntry(date: .now, parkAreaCode: "", configuration: .smiley)
    ParkAreaCodeEntry(date: .now, parkAreaCode: "", configuration: .starEyes)
}
