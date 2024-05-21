//
//  ScannerView.swift
//  carrem
//
//  Created by BAHATTIN KOC on 22.05.2024.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    @ObservedObject var viewModel: CameraViewModel

    func makeUIViewController(context: Context) -> UIViewController {
        let scannerVC = UIViewController()
        let previewLayer = viewModel.getVideoPreviewLayer()
        previewLayer.frame = scannerVC.view.bounds
        scannerVC.view.layer.addSublayer(previewLayer)
        viewModel.startRunning()
        return scannerVC
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator: NSObject { }
}

#Preview {
    ScannerView(viewModel: CameraViewModel())
}
