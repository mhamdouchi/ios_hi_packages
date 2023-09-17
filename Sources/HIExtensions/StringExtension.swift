//
//  StringExtension.swift
//
//
//  Created by Mohamed Hamdouchi on 2/8/22.
//

import Foundation

// MARK: - Variables
public extension String {
    var toBool: Bool {
        Bool(self) ?? false
    }

    var toChar: Character {
        Character(self)
    }

    var toData: Data? {
        data(using: .utf8)
    }
    
    var toDouble: Double? {
        let value = preparedToDecimalNumberConversion

        guard let doubleValue = Double(value)
        else { return nil }

        return doubleValue
    }

    var toInt: Int? {
        Int(self) ?? nil
    }

    var toAlphaNumericsOnly: String {
        components(separatedBy: CharacterSet.alphanumerics.inverted).joined()
    }

    var toLettersOnly: String {
        components(separatedBy: CharacterSet.letters.inverted).joined()
    }

    var toNumbersOnly: String {
        components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }

    var removeSpaces: String {
        components(separatedBy: .whitespaces).joined()
    }
    
    func addCommas() -> String {
        let formatter = NumberFormatter()

        formatter.numberStyle = .decimal

        guard let number = formatter.number(from: self),
              let numberWithCommas = formatter.string(from: number)
        else { return self }

        return numberWithCommas
    }
}

// MARK: - Localizable
public extension String {
    func localized(_ language: String? = nil) -> String {
        let localizedString: String

        if let language = language,
           let path = Bundle.main.path(forResource: language, ofType: "lproj"),
           let bundle = Bundle(path: path)
        {
            localizedString = NSLocalizedString(self, tableName: nil, bundle: bundle, value: kEmptyString, comment: kEmptyString)
        } else {
            localizedString = NSLocalizedString(self, comment: kEmptyString)
        }

        return localizedString
    }

    func localized(with arguments: [CVarArg], for language: String? = nil) -> String {
        String(format: localized(language), arguments: arguments)
    }
}

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

// MARK: - Number Check
public extension String {
    func hasNumbersOnly() -> Bool {
        guard !isEmpty else { return false }

        let characterSet = NSMutableCharacterSet()

        characterSet.addCharacters(in: "0123456789")

        return rangeOfCharacter(from: characterSet.inverted as CharacterSet) == nil
    }
}

// MARK: - Common
public extension String {
    static func generateUUID() -> String {
        UUID().uuidString.uppercased()
    }
}

// MARK: - Letters Check
public extension String {
    enum LettersType {
        case lettersWithCustom(String)
        case numbersWithCustom(String)
        case alphaNumericWithCustom(String)

        static let letters: String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        static let numbers: String = "1234567890"

        var value: String {
            switch self {
                case let .lettersWithCustom(customCharacters): return Self.letters + customCharacters
                case let .numbersWithCustom(customNumbers): return Self.numbers + customNumbers
                case let .alphaNumericWithCustom(customNumbers): return Self.letters + Self.numbers + customNumbers
            }
        }
    }

    func hasLettersOnly(_ type: LettersType = .lettersWithCustom(kEmptyString)) -> Bool {
        let characterSet = NSMutableCharacterSet()

        characterSet.addCharacters(in: type.value)

        return rangeOfCharacter(from: characterSet.inverted as CharacterSet) == nil
    }
}

// MARK: - UUID Validator
public extension String {
    func isValidUUIDString() -> Bool {
        let uuidPattern = #"^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$"#
        let regex = try! NSRegularExpression(pattern: uuidPattern, options: [])
        let range = NSRange(location: 0, length: utf16.count)

        return regex.firstMatch(in: self, options: [], range: range) != nil
    }
}

// MARK: - Private Methods
extension String {
    private var preparedToDecimalNumberConversion: String {
        split { !CharacterSet(charactersIn: "\($0)").isSubset(of: CharacterSet.decimalDigits) }.joined(separator: kDotString)
    }
}
