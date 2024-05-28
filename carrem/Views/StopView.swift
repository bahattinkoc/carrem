//
//  StopView.swift
//  carrem
//
//  Created by BAHATTIN KOC on 28.05.2024.
//

import SwiftUI

struct StopView: View {
    @State private var hidePast = true

    var body: some View {
        VStack {
            Spacer()
            Button(action: {
                // TODO: - son kayıt noktasını kaydet ve aktif kayıdı sil.
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
