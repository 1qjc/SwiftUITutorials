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
      Tab("Friends", systemImage: "person.and.person") {
        FriendListView()
      }
      Tab("Birthdays", systemImage: "birthday.cake.fill") {
        BirthdayView()
      }
      Tab("Movies", systemImage: "film.stack") {
        FilteredMovieListView()
      }
      
      Tab("Chat", systemImage: "message.fill") {
        ChatView()
      }
      
      Tab("Weather", systemImage: "rainbow") {
        ForecastView()
      }
      
      Tab("Welcome", systemImage: "leaf.fill") {
        WelcomeView()
      }
      Tab("Features", systemImage: "pencil.and.scribble") {
        FeaturesView()
      }
      Tab("DiceRoller", systemImage: "dice.fill") {
        DiceRollerView()
      }
      Tab("PickAPal", systemImage: "person.fill.badge.plus") {
        PickAPalView()
      }
      Tab("ScoreKeeper", systemImage: "numbers.rectangle.fill") {
        ScoreKeeperView()
      }
    }
    //    .background(Gradient(colors: grandientColors))
    //    .tabViewStyle(.page)
  }
}

#Preview {
  ContentView().modelContainer(SampleData.shared.modelContainer)
}
