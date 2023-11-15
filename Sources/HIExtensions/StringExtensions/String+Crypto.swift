//
//  StringExtension.swift
//
//
//  Created by Mohamed Hamdouchi on 2/8/22.
//

import CommonCrypto
import Foundation

// MARK: - Crypto
public extension String {
    func toSha256Hash() -> String? {
        if let data = data(using: .utf8) {
            var digest = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))

            _ = data.withUnsafeBytes {
                CC_SHA256($0.baseAddress, CC_LONG(data.count), &digest)
            }

            let hash = digest.map { String(format: "%02hhx", $0) }.joined()

            return hash
        }

        return nil
    }
}
