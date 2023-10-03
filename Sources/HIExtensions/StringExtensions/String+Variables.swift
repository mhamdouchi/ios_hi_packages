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
        guard unicodeScalars.count == 1,
              let firstScalar = unicodeScalars.first
        else { return Character(" ") }

        return Character(firstScalar)
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

// MARK: - Private Methods
extension String {
    private var preparedToDecimalNumberConversion: String {
        split { !CharacterSet(charactersIn: "\($0)").isSubset(of: CharacterSet.decimalDigits) }.joined(separator: kDotString)
    }
}
