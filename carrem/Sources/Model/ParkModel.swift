//
//  ParkModel.swift
//  carrem
//
//  Created by BAHATTIN KOC on 28.05.2024.
//

import Foundation
import SwiftData

@Model
class ParkModel {
    var code: String?
    var latitude: Double?
    var longitude: Double?
    var image: Data?
    var date: String?
    var time: String?
    var isParking: Bool?

    init(
        code: String? = nil,
        latitude: Double? = nil,
        longitude: Double? = nil,
        image: Data? = nil,
        date: String? = nil,
        time: String? = nil,
        isParking: Bool? = nil
    ) {
        self.code = code
        self.latitude = latitude
        self.longitude = longitude
        self.image = image
        self.date = date
        self.time = time
        self.isParking = isParking
    }
}
