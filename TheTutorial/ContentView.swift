//
//  ContentView.swift
//  theTutorial
//
//  Created by 1qjc on 6/4/25.

import SwiftData
import SwiftUI

let grandientColors: [Color] = [
  .gradientTop,
  .gradientBottom,
]

struct ContentView: View {
  var body: some View {
    TabView {
//      ChatView()
//      
//      ForecastView()
//      
//      WelcomePage()
//      FeaturesPage()
//      
//      DiceRollerView()
//      
//      PickAPalView()
//      
//      ScoreKeeperView()
      
      BirthdayView().modelContainer(for: Friend.self)

    }
//    .background(Gradient(colors: grandientColors))
    .tabViewStyle(.page)
    
  }
}

#Preview {
  ContentView()
}
