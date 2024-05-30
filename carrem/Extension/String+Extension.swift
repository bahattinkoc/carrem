//
//  String+Extension.swift
//  carrem
//
//  Created by BAHATTIN KOC on 30.05.2024.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
