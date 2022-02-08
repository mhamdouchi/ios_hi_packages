//
//  StringExtension.swift
//  
//
//  Created by Mohamed Hamdouchi on 2/8/22.
//

import Foundation

public extension String {
    static func generateUUID() -> String {
        return UUID().uuidString.uppercased()
    }
    
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
    
    var toDouble: Double {
        let value = self.preparedToDecimalNumberConversion
        
        guard let doubleValue = Double(value) else { return .zero }
        
        return doubleValue
    }
    
    func localize() -> String {
        return NSLocalizedString(self, comment: kEmptyString)
    }
    
    func localize(with arguments: [CVarArg]) -> String {
        return String(format: NSLocalizedString(self, comment: kEmptyString), arguments: arguments)
    }
    
    func hasLettersOnly() -> Bool {
        let characterSet = NSMutableCharacterSet()
        
        characterSet.addCharacters(in: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ .")
        
        return self.rangeOfCharacter(from: characterSet.inverted as CharacterSet) == nil
    }
    
    func hasNumbersOnly() -> Bool {
        let characterSet = NSMutableCharacterSet()
        
        characterSet.addCharacters(in: "0123456789")
        
        return self.rangeOfCharacter(from: characterSet.inverted as CharacterSet) == nil
    }
}

// MARK - Private Methods
extension String {
    private var preparedToDecimalNumberConversion: String {
        split { !CharacterSet(charactersIn: "\($0)").isSubset(of: CharacterSet.decimalDigits) }.joined(separator: kDotString)
    }
}
