//
//  Birthdayview.swift
//  TheTutorial
//
//  Created by 1qjc on 6/5/25.
//

import SwiftData
import SwiftUI

struct BirthdayView: View {
  @Query(sort: \Friend.birthday) private var friends: [Friend]
  @Environment(\.modelContext) private var context

  @State private var newName = ""
  @State private var newDate = Date.now

  var body: some View {
    NavigationStack {
      List(friends) { friend in
        HStack {
          if friend.isBirthdayToday {
            Image(systemName: "birthday.cake.fill")
          }
          Text(friend.name)
            .bold(friend.isBirthdayToday)
          Spacer()
          Text(friend.birthday, format: .dateTime.month(.wide).day().year())
        }
      }
      .navigationTitle("Birthdays")
      .safeAreaInset(edge: .bottom) {
        VStack(alignment: .center, spacing: 20) {
          Text("New Birthday")
            .font(.headline)
          DatePicker(
            selection: $newDate,
            in: Date.distantPast...Date.now,
            displayedComponents: .date
          ) {
            TextField("Name", text: $newName)
              .textFieldStyle(.roundedBorder)
          }
          Button("Save") {
            let newFriend = Friend(name: newName, birthday: newDate)
            context.insert(newFriend)

            newName = ""
            newDate = .now
          }
          .bold()
        }
        .padding()
        .background(.bar)
      }
    }
  }
}

#Preview {
  BirthdayView()
    .modelContainer(SampleData.shared.modelContainer)
}
