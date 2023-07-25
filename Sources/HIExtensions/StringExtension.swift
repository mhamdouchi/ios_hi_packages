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
    
    var toDouble: Double {
        let value = preparedToDecimalNumberConversion
        
        guard let doubleValue = Double(value) else { return .zero }
        
        return doubleValue
    }
    
    var toInt: Int? {
        Int(self) ?? nil
    }
    
    var toData: Data? {
        data(using: .utf8)
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
        case lettersOnly
        case lettersPlusSpace
        case lettersPlusSpaceAndPeriod
        case lettersPlusCustom(String)
        
        static let letters: String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

        var value: String {
            switch self {
                case .lettersOnly: return Self.letters
                case .lettersPlusSpace: return Self.letters + " "
                case .lettersPlusSpaceAndPeriod: return Self.letters + " ."
                case let .lettersPlusCustom(customCharacters): return Self.letters + customCharacters
            }
        }
    }

    func hasLettersOnly(_ type: LettersType = .lettersOnly) -> Bool {
        let characterSet = NSMutableCharacterSet()

        characterSet.addCharacters(in: type.value)

        return rangeOfCharacter(from: characterSet.inverted as CharacterSet) == nil
    }
}

// MARK: - Private Methods
extension String {
    private var preparedToDecimalNumberConversion: String {
        split { !CharacterSet(charactersIn: "\($0)").isSubset(of: CharacterSet.decimalDigits) }.joined(separator: kDotString)
    }
}
