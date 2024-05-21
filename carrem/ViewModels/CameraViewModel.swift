//
//  CameraViewModel.swift
//  carrem
//
//  Created by BAHATTIN KOC on 22.05.2024.
//

import SwiftUI
import AVFoundation

class CameraViewModel: NSObject, ObservableObject {
    @Published var capturedImage: UIImage?
    @Published var wordList: [String]?
    @Published var showPhotoDetailView = false

    private var captureSession: AVCaptureSession!
    private var photoOutput: AVCapturePhotoOutput!
    private var videoPreviewLayer: AVCaptureVideoPreviewLayer!

    override init() {
        super.init()
        setupCamera()
    }

    // MARK: - INTERNAL FUNCTIONS

    func startRunning() {
        DispatchQueue.global(qos: .background).async {
            self.captureSession.startRunning()
        }
    }

    func stopRunning() {
        captureSession.stopRunning()
    }

    func getVideoPreviewLayer() -> AVCaptureVideoPreviewLayer {
        if videoPreviewLayer == nil {
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            videoPreviewLayer.videoGravity = .resizeAspectFill
        }
        return videoPreviewLayer
    }

    func takePhoto() {
        let settings = AVCapturePhotoSettings()
        photoOutput.capturePhoto(with: settings, delegate: self)
    }

    // MARK: - PRIVATE FUNCTIONS

    private func setupCamera() {
        captureSession = AVCaptureSession()
        captureSession.sessionPreset = .photo

        guard let backCamera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back),
              let input = try? AVCaptureDeviceInput(device: backCamera) else {
            return
        }

        captureSession.addInput(input)
        photoOutput = AVCapturePhotoOutput()
        captureSession.addOutput(photoOutput)
    }
}

// MARK: - EXTENSIONS

extension CameraViewModel: AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let data = photo.fileDataRepresentation(), let image = UIImage(data: data) else {
            return
        }
        stopRunning()
        capturedImage = image
        showPhotoDetailView = true
        // OCR işlemini burada gerçekleştirebilirsiniz ve wordList'i güncelleyebilirsiniz.
    }
}
