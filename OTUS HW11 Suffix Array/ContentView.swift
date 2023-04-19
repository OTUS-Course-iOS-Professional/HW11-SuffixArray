//
//  ContentView.swift
//  OTUS HW11 Suffix Array
//
//  Created by Александр Касьянов on 19.04.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("Suffix array")
                .font(.title)
            Spacer()
            Spacer()
            TextFieldElement(inputedWord: .init())
                .padding(.top, 1)
                .padding(.leading, 30)
                .padding(.trailing, 30)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
