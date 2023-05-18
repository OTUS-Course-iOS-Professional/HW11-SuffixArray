//
//  ContentView.swift
//  OTUS HW11 Suffix Array
//
//  Created by Александр Касьянов on 19.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputedWord = ""
    @ObservedObject private var viewModel = SuffixViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            Spacer()
            Text("Suffix array")
                .font(.title)
            Spacer()
            TextField("Search", text: $inputedWord)
                .foregroundColor(.black)
                .truncationMode(.tail)
                .autocapitalization(.none)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.black, lineWidth: 3)
                )
                .padding()
                .onChange(of: inputedWord) { text in
                    Task {
                        await viewModel.countSuffixMatchesIn(text: text)
                    }
                }
            
            List {
                ForEach(viewModel.suffixModels, id: \.self) { model in
                    if model == viewModel.suffixModels.first {
                        Text("Суффикс \(model.suffix) - \(model.searchTime) нс")
                            .foregroundColor(.green)
                    } else if model == viewModel.suffixModels.last {
                        Text("Суффикс \(model.suffix) - \(model.searchTime) нс")
                            .foregroundColor(.red)
                    } else {
                        Text("Суффикс \(model.suffix) - \(model.searchTime) нс")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
