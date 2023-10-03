//
//  StringExtension.swift
//
//
//  Created by Mohamed Hamdouchi on 2/8/22.
//

import Foundation

// MARK: - UUID
public extension String {
    static func generateUUID() -> String {
        UUID().uuidString.uppercased()
    }
    
    func isValidUUIDString() -> Bool {
        let uuidPattern = #"^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$"#
        let regex = try! NSRegularExpression(pattern: uuidPattern, options: [])
        let range = NSRange(location: 0, length: utf16.count)
        
        return regex.firstMatch(in: self, options: [], range: range) != nil
    }
}
