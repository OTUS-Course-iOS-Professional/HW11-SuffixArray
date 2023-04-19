//
//  OTUS_HW11_Suffix_ArrayApp.swift
//  OTUS HW11 Suffix Array
//
//  Created by Александр Касьянов on 19.04.2023.
//

import SwiftUI

@main
struct OTUS_HW11_Suffix_ArrayApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(TextFieldElementViewModel())
                .environmentObject(SegmentedViewModel())
        }
    }
}
