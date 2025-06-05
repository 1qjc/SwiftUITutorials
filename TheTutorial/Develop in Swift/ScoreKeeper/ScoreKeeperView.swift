//
//  ScoreKeeperView.swift
//  TheTutorial
//
//  Created by 1qjc on 6/5/25.
//

import SwiftUI

struct ScoreKeeperView: View {
  @State private var scoreboard = Scoreboard()
  @State private var startingPoints = 0

  var body: some View {
    VStack {
      Text("Score Keeper")
        .font(.title)
        .bold()
        .padding(.bottom)
      
      SettingsView(doesHighestScoreWin: $scoreboard.doesHighestScoreWin, startingPoints: $startingPoints)
        .disabled(scoreboard.state != .setup)


      Grid {
        GridRow {
          Text("Player").gridColumnAlignment(.leading)
          Text("Score")
            .opacity(scoreboard.state == .setup ? 0 : 1.0)

        }
        ForEach($scoreboard.players) { $player in
          GridRow {
            HStack {
              if scoreboard.winners.contains(player) {
                Image(systemName: "crown.fill")
                  .foregroundStyle(Color.yellow)
              }
              TextField("Name", text: $player.name).foregroundStyle(player.color)
                .disabled(scoreboard.state != .setup)

            }
            Text("\(player.score)")                            .opacity(scoreboard.state == .setup ? 0 : 1.0)

            Stepper("\(player.score)", value: $player.score, in: 0...100).labelsHidden()                            .opacity(scoreboard.state == .setup ? 0 : 1.0)

          }
        }
      }.padding()

      Button("Add Player", systemImage: "plus") {
        scoreboard.players.append(Player(name: "", score: 0, color: Color.random))
      }
        .opacity(scoreboard.state == .setup ? 1.0 : 0)

      Spacer()
      HStack{
        switch scoreboard.state {
        case .setup:
          Button("Start Game", systemImage: "play.fill") {
            scoreboard.state = .playing
            scoreboard.resetScores(to: startingPoints)
          }
        case .playing:
          Button("End Game", systemImage: "stop.fill") {
            scoreboard.state = .gameOver
          }
        case .gameOver:
          Button("Reset Game", systemImage: "arrow.counterclockwise") {
            scoreboard.state = .setup
          }
          //      default:
          //        EmptyView()
        }
      }
      .buttonStyle(.bordered)
//      .buttonBorderShape(.capsule)
//      .controlSize(.large)
//      .tint(.blue)
    }
    .padding()
  }
}

#Preview {
  ScoreKeeperView()
}
