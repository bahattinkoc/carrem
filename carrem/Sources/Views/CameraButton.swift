//
//  CameraButton.swift
//  carrem
//
//  Created by BAHATTIN KOC on 21.05.2024.
//

import SwiftUI

struct CameraButton: View {
    @State private var isPressed = false
    var action: () -> Void

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.primary, lineWidth: 4)
                .frame(width: 80, height: 80)

            Button(action: {
                action()
                performHapticFeedback()
            }) {
                ZStack {
                    Circle()
                        .fill(Color.primary)
                        .frame(width: 68, height: 68)
                        .scaleEffect(isPressed ? 0.9 : 1.0)
                }
            }
            .onLongPressGesture(minimumDuration: 0.1, pressing: { isPressing in
                withAnimation(.easeInOut(duration: 0.1)) {
                    self.isPressed = isPressing
                }
            }, perform: {})
        }
    }

    private func performHapticFeedback() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }
}


struct CameraButton_Previews: PreviewProvider {
    static var previews: some View {
        CameraButton(action: {})
    }
}
