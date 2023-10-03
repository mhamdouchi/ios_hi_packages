//
//  StringExtension.swift
//
//
//  Created by Mohamed Hamdouchi on 2/8/22.
//

import Foundation

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
