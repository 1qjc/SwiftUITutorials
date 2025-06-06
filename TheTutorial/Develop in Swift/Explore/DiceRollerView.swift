//
//  DiceRollerView.swift
//  TheTutorial
//
//  Created by 1qjc on 6/4/25.
//

import SwiftUI

struct DiceRollerView: View {
  @State private var numberOfDice: Int = 1

  var body: some View {
    VStack {
      Text("Dice Roller")
        .font(.largeTitle.lowercaseSmallCaps())
        .foregroundStyle(.white)

      HStack {
        ForEach(1...numberOfDice, id: \.description) { _ in
          DiceView()
        }
      }

      HStack(spacing: 40) {
        Button("Remove", systemImage: "minus.circle.fill") {
          withAnimation {
            numberOfDice -= 1
          }
        }
        .disabled(numberOfDice == 1)
        .symbolRenderingMode(.monochrome)
        Button("Add",systemImage: "plus.circle.fill") {
          withAnimation {
            numberOfDice += 1
          }
        }.symbolRenderingMode(.hierarchical)
        .disabled(numberOfDice == 5)
      }.padding()
        .labelStyle(.iconOnly)
        .font(.title)
    }
    .frame(maxWidth:.infinity, maxHeight: .infinity,)
    .padding()
    .background(.diceRollerBackground)
    .tint(.white)
  }
}

#Preview {
  DiceRollerView()
}
