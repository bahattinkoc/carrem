//
//  FrameView.swift
//  carrem
//
//  Created by BAHATTIN KOC on 21.05.2024.
//

import SwiftUI

struct FrameView: View {
    var image: CGImage?
    
    private let label = Text("Video feed")
    
    var body: some View {
        if let image = image {
            GeometryReader { geometry in
                Image(image, scale: 1.0, label: label)
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: geometry.size.width,
                        height: geometry.size.height,
                        alignment: .center)
                    .clipped()
            }
        } else {
            EmptyView()
        }
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        FrameView(image: nil)
    }
}
