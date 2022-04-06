//
//  BundleExtension.swift
//
//
//  Created by Mohamed Hamdouchi on 2/12/22.
//

import Foundation

public extension Bundle {
    static var versionNumber: String? {
        infoDictionary?["CFBundleShortVersionString"] as? String
    }

    static var buildNumber: String? {
        infoDictionary?["CFBundleVersion"] as? String
    }
}
