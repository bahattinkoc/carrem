//
//  OCRHelper.swift
//  carrem
//
//  Created by BAHATTIN KOC on 26.05.2024.
//

import Vision
import UIKit

typealias CompletionBlock = () -> Void
typealias TypedCompletionBlock<T> = (T) -> Void
typealias StringListBlock = TypedCompletionBlock<[String]>

final class OCRHelper {

    // MARK: - LIFECYCLE

    private init() {}

    // MARK: - PROPERTIES

    static var shared = OCRHelper()

    // MARK: - INTERNAL FUNCTIONS

    func detectOCR(image: UIImage, completion: @escaping StringListBlock) {
        guard let cgImage = image.cgImage else { return }
        let request = VNRecognizeTextRequest(completionHandler: { (request, error) in
            if let error = error {
                // TODO: - Show popup
                print("Metin tanıma hatası: \(error.localizedDescription)")
                return
            }
            guard let observations = request.results as? [VNRecognizedTextObservation] else { return }

            let strings: [String] = observations.compactMap { observation in
                guard let topCandidate = observation.topCandidates(1).first else { return nil }
                return topCandidate.string
            }
            completion(strings)
        })
        request.usesLanguageCorrection = false
        request.recognitionLevel = .accurate

        let imageRequestHandler = VNImageRequestHandler(cgImage: cgImage, orientation: .up, options: .init())
        do {
            try imageRequestHandler.perform([request])
        } catch {
            // TODO: - Show popup
            print("Algılama işlemi başarısız: \(error.localizedDescription)")
        }
    }

    func processMultilineTexts(_ texts: [String]) -> [String] {
        var processedTexts: [String] = []
        for text in texts {
            let lines = text.components(separatedBy: "\n")
            for line in lines {
                if let processedLine = preprocessText(line), isValidParkingLabel(processedLine) {
                    processedTexts.append(processedLine)
                }
            }
        }
        return processedTexts
    }

    func isValidParkingLabel(_ text: String) -> Bool {
        let pattern = "[A-Z]\\d+"
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        return regex.firstMatch(in: text, options: [], range: NSRange(location: 0, length: text.utf16.count)) != nil
    }

    func preprocessText(_ text: String) -> String? {
        let processedText = text.trimmingCharacters(in: .whitespacesAndNewlines)
        if processedText.count > 0 {
            return processedText
        }
        return nil
    }
}
