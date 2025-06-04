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

    HStack {
      DayForecast(day: "Mon", isRainy: false, high: 70, low: 50)
      DayForecast(day: "Tue",isRainy: true, high: 60, low: 40)
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
      Text("Low: \(low)")
        .fontWeight(.medium)
        .foregroundStyle(Color.secondary)
    }
    .padding()
  }
}
