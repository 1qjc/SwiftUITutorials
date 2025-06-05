//
//  WelcomePage.swift
//  TheTutorial
//
//  Created by 1qjc on 6/4/25.
//

import SwiftUI

struct WelcomePage: View {
    var body: some View {
      VStack {
        ZStack {
          RoundedRectangle(cornerRadius: 30)
            .frame(width: 150, height: 150)
            .foregroundStyle(.tint)
          
          Image(systemName: "dog")
            .font(.system(size: 70))
            .foregroundStyle(.white)
        }
        Text("Welcom to 1qjc")
          .font(.title)
          .fontWeight(.semibold)
          .fontDesign(.monospaced)
          .padding(.top)
//          .border(.black, width: 1.5)

        Text("Hi mom!")
          .font(.title2)
          .fontDesign(.monospaced)
          .multilineTextAlignment(.center)
//          .border(.black, width: 1.5)
      }
//      .border(.orange, width: 1.5)
      .frame(maxWidth:.infinity, maxHeight: .infinity)
      .padding()
      .background(Gradient(colors: grandientColors))
//      .border(.purple, width: 1.5)
    }
}

#Preview {
    WelcomePage()
}
