//
//  SequenceExtension.swift
//  
//
//  Created by Mohamed Hamdouchi on 2/8/22.
//

import Foundation

public extension Sequence where Iterator.Element: Hashable {
    func unique() -> [Iterator.Element] {
        var seen: Set<Iterator.Element> = []
        return filter { seen.insert($0).inserted }
    }
}
