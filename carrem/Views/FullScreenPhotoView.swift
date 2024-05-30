//
//  FullScreenPhotoView.swift
//  carrem
//
//  Created by BAHATTIN KOC on 30.05.2024.
//

import SwiftUI

struct FullScreenPhotoView: View {
    @Environment(\.dismiss) var dismiss
    var fullScreenImageData: Data

    var body: some View {
        ZStack {
            Color.black.opacity(0.7)
                .edgesIgnoringSafeArea(.all)
            Image(uiImage: UIImage(data: fullScreenImageData)!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(24.0)
                .padding()
        }
        .transition(.opacity)
        .onTapGesture {
            withAnimation {
                dismiss()
            }
        }
    }
}

#Preview {
    FullScreenPhotoView(fullScreenImageData: Data())
}
