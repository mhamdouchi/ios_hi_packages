//
//  DateExtension.swift
//
//
//  Created by Mohamed Hamdouchi on 2/8/22.
//

import Foundation

public extension Date {
    func years(from date: Date) -> Int {
        Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
    }

    func months(from date: Date) -> Int {
        Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
    }

    func weeks(from date: Date) -> Int {
        Calendar.current.dateComponents([.weekOfMonth], from: date, to: self).weekOfMonth ?? 0
    }

    func days(from date: Date) -> Int {
        Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }

    func hours(from date: Date) -> Int {
        Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }

    func minutes(from date: Date) -> Int {
        Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }

    func seconds(from date: Date) -> Int {
        Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }

    func offset(from date: Date) -> String {
        if years(from: date) > 0 { return "\(years(from: date))y" }
        if months(from: date) > 0 { return "\(months(from: date))M" }
        if weeks(from: date) > 0 { return "\(weeks(from: date))w" }
        if days(from: date) > 0 { return "\(days(from: date))d" }
        if hours(from: date) > 0 { return "\(hours(from: date))h" }
        if minutes(from: date) > 0 { return "\(minutes(from: date))m" }
        if seconds(from: date) > 0 { return "\(seconds(from: date))s" }
        return kEmptyString
    }
}

public extension Date {
    static func now() -> String {
        Date().format(.iso8601WithFraction)
    }
}

public extension Date {
    enum DateFormats {
        case full
        case iso8601
        case iso8601WithFraction
        case long
        case medium
        case monthDay
        case monthDayYear
        case short
        case timeAmPm
    }

    func format(_ dateFormat: DateFormats) -> String {
        let formatter = DateFormatter()

        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"

        let formattedDate: String

        switch dateFormat {
            case .full:
                formatter.dateStyle = .full
                formattedDate = formatter.string(from: self)

            case .iso8601:
                formattedDate = iso8601

            case .iso8601WithFraction:
                formattedDate = iso8601WithFraction

            case .long:
                formatter.dateStyle = .long
                formattedDate = formatter.string(from: self)

            case .medium:
                formatter.dateStyle = .medium
                formattedDate = formatter.string(from: self)

            case .monthDay:
                formatter.dateFormat = "MMM. dd"
                formattedDate = formatter.string(from: self)

            case .monthDayYear:
                formatter.dateFormat = "MMM. dd, yyyy"
                formattedDate = formatter.string(from: self)

            case .short:
                formatter.dateStyle = .short
                formattedDate = formatter.string(from: self)

            case .timeAmPm:
                formatter.dateFormat = "hh:mm a"
                formattedDate = formatter.string(from: self)
        }

        return formattedDate
    }
}

// MARK: - Private Methods
extension Date {
    private var iso8601: String {
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        let formattedDate = isoFormatter.string(from: self)
        return formattedDate
    }

    private var iso8601WithFraction: String {
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        isoFormatter.formatOptions = [.withFullDate, .withFullTime, .withFractionalSeconds, .withDashSeparatorInDate]
        return isoFormatter.string(from: self)
    }
}
