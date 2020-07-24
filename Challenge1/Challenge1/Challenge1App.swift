//
//  Challenge1App.swift
//  Challenge1
//
//  Created by ali on 7/17/20.
//

import SwiftUI

@main
struct Challenge1App: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: MeasureViewModel(inputAmount: 0))
        }
    }
}
