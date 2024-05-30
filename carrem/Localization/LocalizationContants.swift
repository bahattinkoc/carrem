//
//  LocalizationContants.swift
//  carrem
//
//  Created by BAHATTIN KOC on 30.05.2024.
//

enum LocalizationContants {

    enum CameraView {
        static var captureParkPhoto: String { "captureParkPhoto".localized }
    }

    enum MainView {
        static var privacyPolicy: String { "privacyPolicy".localized }
        static var termsOfConditions: String { "termsOfConditions".localized }
    }

    enum OCRListView {
        static var addParkArea: String { "addParkArea".localized }
        static var detectedAreaCodes: String { "detectedAreaCodes".localized }
    }

    enum ParkHistoryListView {
        static var parkHistory: String { "parkHistory".localized }
    }

    enum StopView {
        static var stop: String { "stop".localized }
    }

    enum VerifyOCRView {
        static var done: String { "done".localized }
        static var save: String { "save".localized }
        static var verifyParkAreaCode: String { "verifyParkAreaCode".localized }
    }    

    enum CarParkReminder {
        static var noPark: String { "noPark".localized }
        static var carParkReminder: String { "carParkReminder".localized }
        static var carParkReminderDescription: String { "carParkReminderDescription".localized }
    }
}
