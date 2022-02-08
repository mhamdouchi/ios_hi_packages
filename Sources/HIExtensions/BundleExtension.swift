//
//  BundleExtension.swift
//  
//
//  Created by Mohamed Hamdouchi on 2/12/22.
//

import Foundation

extension Bundle {
    var versionNumber: String? {
        infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    var buildNumber: String? {
        infoDictionary?["CFBundleVersion"] as? String
    }
}
