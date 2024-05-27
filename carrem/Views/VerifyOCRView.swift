//
//  VerifyOCRView.swift
//  carrem
//
//  Created by BAHATTIN KOC on 26.05.2024.
//

import SwiftUI
import WidgetKit

struct VerifyOCRView: View {
    @AppStorage("activeParkAreaCode", store: UserDefaults(suiteName: "group.carrem"))
    var parkAreaCode: String = ""

    @State private var text: String = ""

    init(ocrText: String) {
        _text = State(initialValue: ocrText)
    }

    var body: some View {
        VStack {
            Spacer()

            TextField("Metni girin", text: $text)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .padding()

            Spacer()

            Button(action: {
                self.parkAreaCode = text
                WidgetCenter.shared.reloadAllTimelines()
            }) {
                Text("Onayla")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationBarTitle("OCR Onayı")
    }
}

#Preview {
    VerifyOCRView(ocrText: "C16")
}
