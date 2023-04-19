//
//  SegmentedControlElement.swift
//  OTUS HW11 Suffix Array
//
//  Created by Александр Касьянов on 19.04.2023.
//

import SwiftUI

struct SegmentedControlElement: View {
    
    @EnvironmentObject var viewModel: SegmentedViewModel
    @EnvironmentObject var textFieldViewModel: TextFieldElementViewModel
    @State var buttonTitle: String = "ASC"
    
    private var pickerView: some View {
        Picker("Cуффиксы: ", selection: $viewModel.selectedSegment) {
            Text("Cуффиксы")
                .tag(0)
            Text("Топ 10")
                .tag(1)
        }
        .pickerStyle(.segmented)
        .colorMultiply(.blue)
    }
    
    private var buttonSort: some View {
        Button(buttonTitle) {
            buttonTitle == "ASC" ? (buttonTitle = "DESC") : (buttonTitle = "ASC")
            setAlphabeticalSort()
        }
        .fontWeight(.bold)
        .padding()
        .background(.black)
        .cornerRadius(20)
        .foregroundColor(.white)
        .padding(5)
    }
    
    var body: some View {
        pickerView
        ScrollView {
            if viewModel.selectedSegment == 0 {
                buttonSort
                Text(textFieldViewModel.suffixCountSorted)
                    .onAppear {
                        setAlphabeticalSort()
                    }
            }
            if viewModel.selectedSegment == 1 {
                Text(textFieldViewModel.suffixCountSorted)
                    .onAppear {
                        textFieldViewModel.setTop10Sort()
                    }
            }
        }
    }
    
    private func setAlphabeticalSort() {
        if buttonTitle == "ASC" {
            textFieldViewModel.setAlphabeticalSort(type: .asc)
        } else {
            textFieldViewModel.setAlphabeticalSort(type: .desc)
        }
    }
}

struct SegmentedControlElement_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedControlElement()
    }
}
