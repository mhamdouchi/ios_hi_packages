//
//  SequenceExtension.swift
//  
//
//  Created by Mohamed Hamdouchi on 2/8/22.
//

import Foundation

public extension Sequence where Iterator.Element: Hashable {
    func group<U: Hashable>(by key: (Iterator.Element) -> U) -> [U:[Iterator.Element]] {
        Dictionary.init(grouping: self, by: key)
    }
    
    func limit(_ max: Int) -> [Element] {
        enumerated().filter({ $0.offset < max }).map({ $0.element })
    }
    
    func unique() -> [Iterator.Element] {
        var seen: Set<Iterator.Element> = []
        return filter { seen.insert($0).inserted }
    }
}
