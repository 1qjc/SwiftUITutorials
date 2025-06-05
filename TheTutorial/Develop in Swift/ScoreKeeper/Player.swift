//
//  File.swift
//  TheTutorial
//
//  Created by 1qjc on 6/5/25.
//

import Foundation
import SwiftUI

extension Color {
  static var random: Color {
    return Color(
      red: .random(in: 0...1),
      green: .random(in: 0...1),
      blue: .random(in: 0...1)
    )
  }
}

struct Player: Identifiable {
  let id = UUID()

  var name: String
  var score: Int
  var color: Color
}

extension Player: Equatable {
  static func == (lhs: Player, rhs: Player) -> Bool {
    lhs.name == rhs.name && lhs.score == rhs.score
  }
}
