//
//  StringExtension.swift
//
//
//  Created by Mohamed Hamdouchi on 2/8/22.
//

import Foundation

// MARK: - Date
public extension String {
    var toDate: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        let dateString = dateFormatter.date(from: self)

        return dateString
    }

    var iso8601ToDate: Date? {
        let formatter = ISO8601DateFormatter()

        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.formatOptions = [.withFullDate, .withFullTime, .withFractionalSeconds, .withDashSeparatorInDate]

        let date = formatter.date(from: self)

        return date
    }
}
