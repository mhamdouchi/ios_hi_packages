//
//  StringExtension.swift
//
//
//  Created by Mohamed Hamdouchi on 2/8/22.
//

import Foundation

// MARK: - Checker
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

    func hasNumbersOnly() -> Bool {
        guard !isEmpty else { return false }

        let characterSet = NSMutableCharacterSet()

        characterSet.addCharacters(in: "0123456789")

        return rangeOfCharacter(from: characterSet.inverted as CharacterSet) == nil
    }
}
