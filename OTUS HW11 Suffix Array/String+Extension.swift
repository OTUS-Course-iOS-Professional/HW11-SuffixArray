//
//  String+Extension.swift
//  OTUS HW11 Suffix Array
//
//  Created by Александр Касьянов on 18.05.2023.
//

import Foundation

extension String {
    func suffixArray() -> [SuffixModel] {
        let startTime = DispatchTime.now().uptimeNanoseconds
        let indexes = SuffixArray.suffixArray(self).sorted(by: >)
        return indexes.compactMap { index in
            let position = self.index(self.startIndex, offsetBy: index)
            let resultString = String(self[position..<self.endIndex])
            let endTime = DispatchTime.now().uptimeNanoseconds
            return SuffixModel(suffix: resultString, searchTime: (endTime - startTime))
        }
    }
}
