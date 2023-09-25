//
//  BundleExtension.swift
//
//
//  Created by Mohamed Hamdouchi on 2/12/22.
//

import Foundation

public extension Bundle {
    var buildNumber: String? {
        infoDictionary?["CFBundleVersion"] as? String
    }

    var environment: String {
        #if DEBUG
            return "dev"
        #else
            return "prod"
        #endif
    }

    var versionNumber: String? {
        infoDictionary?["CFBundleShortVersionString"] as? String
    }
}
