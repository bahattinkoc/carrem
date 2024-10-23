//
//  CarParkReminderLiveActivity.swift
//  CarParkReminder
//
//  Created by BAHATTIN KOC on 27.05.2024.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct CarParkReminderAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct CarParkReminderLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: CarParkReminderAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension CarParkReminderAttributes {
    fileprivate static var preview: CarParkReminderAttributes {
        CarParkReminderAttributes(name: "World")
    }
}

extension CarParkReminderAttributes.ContentState {
    fileprivate static var smiley: CarParkReminderAttributes.ContentState {
        CarParkReminderAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: CarParkReminderAttributes.ContentState {
         CarParkReminderAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: CarParkReminderAttributes.preview) {
   CarParkReminderLiveActivity()
} contentStates: {
    CarParkReminderAttributes.ContentState.smiley
    CarParkReminderAttributes.ContentState.starEyes
}
