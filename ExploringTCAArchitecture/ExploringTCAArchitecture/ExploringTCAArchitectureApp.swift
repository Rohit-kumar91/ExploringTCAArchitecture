//
//  ExploringTCAArchitectureApp.swift
//  ExploringTCAArchitecture
//
//  Created by Rohit Kumar on 06/08/25.
//

import SwiftUI
import ComposableArchitecture

@main
struct ExploringTCAArchitectureApp: App {
    var body: some Scene {
        WindowGroup {
          ContentView(
            store: Store(initialState: DateTimeFeature.State(title: "", value: "", type: .none),
                         reducer: {
                           DateTimeFeature()
                         }))
        }
    }
}
