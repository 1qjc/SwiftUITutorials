//
//  ChatView.swift
//  TheTutorial
//
//  Created by 1qjc on 6/4/25.
//

import SwiftUI

struct ChatView: View {
  var body: some View {
    VStack(spacing: 25) {
      HStack {
        Text("Knock, knock!")
          .padding()
          .background(Color.yellow, in: RoundedRectangle(cornerRadius: 8))
        Spacer()
      }
      HStack {
        Spacer()
        Text("Who's there?")
          .padding()
          .background(Color.teal, in: RoundedRectangle(cornerRadius: 8))
          .shadow(
            color: Color.teal,
            radius: 8,
            x: 5,
            y: 5
          )
      }
    }
    .padding()
  }
}

#Preview {
  ChatView()
}
