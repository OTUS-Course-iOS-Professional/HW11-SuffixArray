//
//  SuffixIterator.swift
//  OTUS HW11 Suffix Array
//
//  Created by Александр Касьянов on 19.04.2023.
//

import Foundation

final class SuffixIterator: IteratorProtocol {
    private let word: String
    private var indexingIterator: IndexingIterator<[String.Index]>

    init(word: String, suffixes: [String.Index]) {
        self.word = word
        self.indexingIterator = suffixes.makeIterator()
    }

    func next() -> String? {
        guard let next = indexingIterator.next() else { return nil }
        return String(word.suffix(from: next))
    }
}
