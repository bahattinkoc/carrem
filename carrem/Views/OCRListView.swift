//
//  OCRListView.swift
//  carrem
//
//  Created by BAHATTIN KOC on 26.05.2024.
//

import SwiftUI

struct OCRListView: View {
    var wordList: [String]

    var body: some View {
        NavigationView {
            List(wordList.isEmpty ? ["Add park area"] : wordList, id: \.self) { item in
                NavigationLink(destination: VerifyOCRView(ocrText: item)) {
                    Text(item)
                }
            }
        }
        .navigationTitle("Detected Area Codes")
    }
}

#Preview {
    OCRListView(wordList: ["A16", "A17"])
}
