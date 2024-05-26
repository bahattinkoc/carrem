//
//  VerifyOCRView.swift
//  carrem
//
//  Created by BAHATTIN KOC on 26.05.2024.
//

import SwiftUI

struct VerifyOCRView: View {
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
                print("Butona tıklandı")
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
