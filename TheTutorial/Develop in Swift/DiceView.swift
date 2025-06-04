//
//  DiceView.swift
//  TheTutorial
//
//  Created by 1qjc on 6/4/25.
//

import SwiftUI

struct DiceView: View {
  @State private var numberOfPips: Int = 1

    var body: some View {
      VStack {
        Image(systemName: "die.face.\(numberOfPips).fill")
          .resizable()
          .frame(maxWidth: 100,maxHeight: 100)
          .aspectRatio(1, contentMode: .fit)
          .foregroundStyle(.black, .white)
        
        Button("Roll") {
          withAnimation {
            numberOfPips = Int.random(in: 1...6)
          }
        }.buttonBorderShape(.capsule)
          .buttonStyle(.bordered)
      }
    }
}

#Preview {
    DiceView()
    .frame(maxWidth: .infinity,maxHeight: .infinity)
    .background(.gradientBottom)
}
