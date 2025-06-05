//
//  TheTutorialTests.swift
//  TheTutorialTests
//
//  Created by 1qjc on 6/5/25.
//

import Testing

@testable import TheTutorial

struct ScoreKeeperTests {

  @Test("Reset player scores", arguments: [0, 10, 20])
  func resetScores(to newValue: Int) async throws {
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    var scoreboard = Scoreboard(players: [
      Player(name: "Elisha", score: 0, color: .random),
      Player(name: "Andre", score: 5, color: .random),
    ])
    scoreboard.resetScores(to: newValue)
    for player in scoreboard.players {
      #expect(player.score == newValue)
    }
  }
  
  @Test("Highest score wins")
  func highestScoreWins() {
    let scoreboard = Scoreboard(
      players: [
        Player(name: "Elisha", score: 0, color: .random),
        Player(name: "Andre", score: 4, color: .random),
      ],
      state: .gameOver,
      doesHighestScoreWin: true
    )
    let winners = scoreboard.winners
    #expect(winners == [Player(name: "Andre", score: 4, color: .random)])
  }
  
  @Test("Lowest score wins")
  func lowestScoreWins() {
    let scoreboard = Scoreboard(
      players: [
        Player(name: "Elisha", score: 0, color: .random),
        Player(name: "Andre", score: 4, color: .random),
      ],
      state: .gameOver,
      doesHighestScoreWin: false
    )
    let winners = scoreboard.winners
    #expect(winners == [Player(name: "Elisha", score: 0, color: .random)])
  }
  
  @Test("Equal highest score win")
  func equalHighestScoreWin() {
    let scoreboard = Scoreboard(
      players: [
        Player(name: "Elisha", score: 4, color: .random),
        Player(name: "Andre", score: 42, color: .random),
        Player(name: "sda", score: 42, color: .random),

      ],
      state: .gameOver,
      doesHighestScoreWin: true
    )
    let winners = scoreboard.winners
    #expect(winners == [
      Player(name: "Andre", score: 42, color: .random),
      Player(name: "sda", score: 42, color: .random),
    ])
  }

  @Test("Equal lowest score win")
  func equalLowestScoreWin() {
    let scoreboard = Scoreboard(
      players: [
        Player(name: "Elisha", score: 4, color: .random),
        Player(name: "Andre", score: 4, color: .random),
        Player(name: "sda", score: 42, color: .random),
        
      ],
      state: .gameOver,
      doesHighestScoreWin: false
    )
    let winners = scoreboard.winners
    #expect(winners == [
      Player(name: "Elisha", score: 4, color: .random),
      Player(name: "Andre", score: 4, color: .random),
    ])
  }

  
}
