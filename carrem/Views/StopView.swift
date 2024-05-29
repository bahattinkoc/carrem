//
//  StopView.swift
//  carrem
//
//  Created by BAHATTIN KOC on 28.05.2024.
//

import SwiftUI
import WidgetKit

struct StopView: View {
    @AppStorage("activeParkAreaCode", store: UserDefaults(suiteName: "group.carrem"))
    var parkAreaCode: String = ""

    var body: some View {
        VStack {
            Spacer()
            Button(action: {
                // TODO: - son kayıt noktasını kaydet ve aktif kayıdı sil.
                parkAreaCode = ""
                WidgetCenter.shared.reloadAllTimelines()
            }) {
                Text("STOP")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .frame(width: 200, height: 200)
                    .background(Color.red)
                    .cornerRadius(100)
                    .shadow(radius: 10)
            }
            Spacer()
        }
    }
}

#Preview {
    StopView()
}
