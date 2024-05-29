//
//  carremApp.swift
//  carrem
//
//  Created by BAHATTIN KOC on 21.05.2024.
//

import SwiftUI
import SwiftData

@main
struct AppMain: App {
    @AppStorage("activeParkAreaCode", store: UserDefaults(suiteName: "group.carrem"))
    var parkAreaCode: String = ""

    var body: some Scene {
        WindowGroup {
            if parkAreaCode.isEmpty {
                MainView()
            } else {
                StopView()
            }
        }
        .modelContainer(for: ParkModel.self)
    }
}
