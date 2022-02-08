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
        return Bool(self) ?? false
    }

    var toDouble: Double {
        let value = preparedToDecimalNumberConversion
        
        guard let doubleValue = Double(value) else { return .zero }
        
        return doubleValue
    }
    
    var toInt: Int? {
        return Int(self) ?? nil
    }    
}

// MARK: - Localizable
public extension String {
    func localized() -> String {
        return NSLocalizedString(self, comment: kEmptyString)
    }
    
    func localized(with arguments: [CVarArg]) -> String {
        return String(format: NSLocalizedString(self, comment: kEmptyString), arguments: arguments)
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
        return UUID().uuidString.uppercased()
    }
}

// MARK: - Letters Check
public extension String {
    enum LettersType {
        case lettersOnly
        case lettersPlusSpace
        case lettersPlusSpaceAndPeriod
        
        var value: String {
            switch self {
                case .lettersOnly: return "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
                case .lettersPlusSpace: return "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ "
                case .lettersPlusSpaceAndPeriod: return "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ."
            }
        }
    }
    
    func hasLettersOnly(_ type: LettersType = .lettersOnly) -> Bool {
        let characterSet = NSMutableCharacterSet()
        characterSet.addCharacters(in: type.value)
        return rangeOfCharacter(from: characterSet.inverted as CharacterSet) == nil
    }
}

// MARK - Private Methods
extension String {
    private var preparedToDecimalNumberConversion: String {
        split { !CharacterSet(charactersIn: "\($0)").isSubset(of: CharacterSet.decimalDigits) }.joined(separator: kDotString)
    }
}
