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
    @State private var isAnimating = false

    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Circle()
                    .foregroundStyle(.red)
                    .frame(width: isAnimating ? 260 : 240, height: isAnimating ? 260 : 240)
                    .opacity(0.7)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
                            isAnimating = true
                        }
                    }
                Button(action: {
                    parkAreaCode = ""
                    WidgetCenter.shared.reloadAllTimelines()
                }) {
                    Text(LocalizationContants.StopView.stop)
                        .bold()
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .frame(width: 200, height: 200)
                        .background(Color.red)
                        .cornerRadius(100)
                        .shadow(radius: 10)
                }
            }
            Spacer()
        }
    }
}

#Preview {
    StopView()
}
