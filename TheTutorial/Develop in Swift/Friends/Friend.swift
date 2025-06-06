//
//  Friend.swift
//  TheTutorial
//
//  Created by 1qjc on 6/5/25.
//

import Foundation
import SwiftData

@Model
class Friend {
  var name: String
  var favoriteMovie: Movie?
  var birthday: Date
  
  init(name: String, birthday: Date = Date.now) {
    self.name = name
    self.birthday = birthday
  }
  
  var isBirthdayToday: Bool {
    Calendar.current.isDateInToday(birthday)
  }
  
  static let sampleData = [
    Friend(name: "Elton Lin", birthday: .now),
    Friend(name: "Jenny Court", birthday: Date(timeIntervalSince1970: 0)),
    Friend(name: "Mayuri"),
    Friend(name: "Rich"),
    Friend(name: "Rody"),
  ]
  
}
