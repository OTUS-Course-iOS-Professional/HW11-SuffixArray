//
//  SuffixArray.swift
//  OTUS HW11 Suffix Array
//
//  Created by Александр Касьянов on 19.04.2023.
//

import Foundation

final class SuffixSequence: Sequence {
    private let word: String
    private var words = [String]()
    private var suffixes = [String.Index]()
   
    init(word: String) {
        self.word = word
        
        self.suffixes = word.indices.sorted { lhs, rhs in
            String(word.suffix(from: lhs)) < String(word.suffix(from: rhs))
        }
    }

    func makeIterator() -> SuffixIterator {
        SuffixIterator(word: word, suffixes: suffixes)
    }
}
