//
//  ContentView.swift
//  ExploringTCAArchitecture
//
//  Created by Rohit Kumar on 06/08/25.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
  let store: StoreOf<DateTimeFeature>
  
  var body: some View {
    VStack {
      WithViewStore(store, observe: { $0 }) { viewStore in
        VStack {
          HStack {
            Text(viewStore.title)
            Text(viewStore.value)
          }
          
          Spacer()
          
          switch viewStore.type {
          case .date, .none:
            Button("Show Time") {
              viewStore.send(.showCurrentTime)
            }
            
          case .time:
            Button("Show Date") {
              viewStore.send(.showCurrentDate)
            }
          }
        }
      }
    }
  }
}

#Preview {
  ContentView(
    store: Store(
      initialState: DateTimeFeature.State(title: "Current Time",
                                          value: "1:00 AM",
                                          type: .time),
      reducer: {
        DateTimeFeature()
      }
    )
  )
}
