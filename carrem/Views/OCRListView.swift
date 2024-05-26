//
//  OCRListView.swift
//  carrem
//
//  Created by BAHATTIN KOC on 26.05.2024.
//

import SwiftUI

struct OCRListView: View {
    let wordList: [String]

    var body: some View {
        NavigationView {
            List(wordList, id: \.self) { item in
                NavigationLink(destination: VerifyOCRView(ocrText: item)) {
                    Text(item)
                }
            }
        }
    }
}

#Preview {
    OCRListView(wordList: ["A16", "A17"])
}
