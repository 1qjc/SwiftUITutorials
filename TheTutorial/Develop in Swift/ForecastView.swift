//
//  ForecastView.swift
//  theTutorial
//
//  Created by 1qjc on 6/4/25.
//

import SwiftData
import SwiftUI

struct ForecastView: View {
  var body: some View {
    ScrollView(.horizontal) {
      HStack {
        DayForecast(day: "Mon", isRainy: false, high: 70, low: 50)
        DayForecast(day: "Tue", isRainy: false, high: 90, low: 80)
        DayForecast(day: "Wed", isRainy: true, high: 50, low: 40)
        DayForecast(day: "Thu", isRainy: false, high: 60, low: 40)
        DayForecast(day: "Fri", isRainy: true, high: 30, low: 10)
        DayForecast(day: "Sat", isRainy: false, high: 60, low: 40)
        DayForecast(day: "Sun", isRainy: true, high: 60, low: 40)
      }
    }
  }
}

#Preview {
  ForecastView()
}

struct DayForecast: View {
  let day: String
  let isRainy: Bool
  let high: Int
  let low: Int

  var iconName: String {
    if isRainy {
      return "cloud.rain.fill"
    } else {
      return "sun.max.fill"
    }
  }
  var iconColor: Color {
    if isRainy {
      return Color.blue
    } else {
      return Color.yellow
    }
  }
  
  var tempColor: Color{
    if high > 80 {
      return Color.red
    } else {
      return .primary
    }
  }
  

  var body: some View {
    VStack {
      Text(day)
        .font(.headline)
      Image(systemName: iconName)
        .foregroundColor(iconColor)
        .font(.largeTitle)
        .padding(5)
      Text("High: \(high)")
        .fontWeight(.semibold)
        .foregroundStyle(tempColor)
      Text("Low: \(low)")
        .fontWeight(.medium)
        .foregroundStyle(Color.secondary)
    }
    .padding()
  }
}
