//
//  ParkHistoryListView.swift
//  carrem
//
//  Created by BAHATTIN KOC on 30.05.2024.
//

import SwiftUI
import SwiftData

struct ParkHistoryListView: View {
    @Query private var parkHistoryList: [ParkModel]

    var body: some View {
        NavigationStack {
            List {
                ForEach(parkHistoryList) { park in
                    ParkHistoryCell(park: park)
                }
            }
            .navigationTitle(LocalizationContants.ParkHistoryListView.parkHistory)
        }
    }
}

#Preview {
    ParkHistoryListView()
}
