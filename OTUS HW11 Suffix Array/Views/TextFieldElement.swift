//
//  TextFieldElement.swift
//  OTUS HW11 Suffix Array
//
//  Created by Александр Касьянов on 19.04.2023.
//

import SwiftUI

struct TextFieldElement: View {
    
    @State var inputedWord: String = .init()
    @EnvironmentObject var viewModel: TextFieldElementViewModel
    
    var InputedField: some View {
        TextField("Ведите слово:", text: $inputedWord, axis: .vertical)
            .foregroundColor(.black)
            .truncationMode(.tail)
            .autocapitalization(.none)
            .padding()
            .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.black, lineWidth: 3)
                )
            .padding()
    }
    
    var body: some View {
        InputedField
            .lineLimit(100)
            .onSubmit {
                viewModel.countSuffixesFrom(text: inputedWord)
            }
        SegmentedControlElement()
            .padding(.top, 5)
    }
}

struct TextFieldElement_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldElement()
    }
}
