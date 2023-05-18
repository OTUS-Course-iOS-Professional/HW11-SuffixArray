//
//  SuffixArray.swift
//  OTUS HW11 Suffix Array
//
//  Created by Александр Касьянов on 19.04.2023.
//

import Foundation

final class SuffixArray {
    static func suffixArray(_ s: String) -> [Int] {
        let n = s.count
        var sa = Array(0..<n)
        var rank = Array(s.utf16).map { Int($0) }
        var tmp = Array(repeating: 0, count: n)
        var k = 1
        
        func compare(_ i: Int, _ j: Int) -> Bool {
            if rank[i] != rank[j] {
                return rank[i] < rank[j]
            }
            let ri = i + k < n ? rank[i + k] : -1
            let rj = j + k < n ? rank[j + k] : -1
            return ri < rj
        }
        
        while k <= n {
            sa.sort { compare($0, $1) }
            tmp[sa[0]] = 0
            for i in 1..<n {
                tmp[sa[i]] = tmp[sa[i - 1]] + (compare(sa[i - 1], sa[i]) ? 1 : 0)
            }
            rank = tmp
            k *= 2
        }
        
        return sa
    }
}

