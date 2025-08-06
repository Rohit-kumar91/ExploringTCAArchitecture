//
//  DateTimeFeature.swift
//  ExploringTCAArchitecture
//
//  Created by Rohit Kumar on 06/08/25.
//

import ComposableArchitecture
import Foundation


struct DateTimeFeature: Reducer {
  
  struct State: Equatable {
    var title: String
    var value: String
    var type: DateType
  }
  
  enum DateType {
    case date
    case time
    case none
  }
  
  enum Action: Equatable {
    case showCurrentDate
    case showCurrentTime
  }
  
  func reduce(into state: inout State, action: Action) -> Effect<Action> {
    switch action {
    case .showCurrentDate:
      state.title = "Current Date"
      state.value = getDate()
      state.type = .date
      return .none
      
    case .showCurrentTime:
      state.title = "Current Time"
      state.value = getTime()
      state.type = .time
      return .none
    }
  }
  
  private func getTime() -> String {
    let formatter = DateFormatter()
    formatter.timeStyle = .medium
    formatter.dateStyle = .none
    return formatter.string(from: Date())
  }

  private func getDate() -> String {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .none
    return formatter.string(from: Date())
  }
}
