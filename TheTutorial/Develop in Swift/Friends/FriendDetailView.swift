//
//  FriendDetailView.swift
//  TheTutorial
//
//  Created by 1qjc on 6/6/25.
//

import SwiftUI
import SwiftData

struct FriendDetailView: View {
  @Bindable var friend: Friend
  let isNew: Bool

  @Environment(\.dismiss) private var dismiss
  @Environment(\.modelContext) private var context

  @Query(sort: \Movie.title) private var movies: [Movie]

  init(friend: Friend, isNew: Bool = false) {
    self.friend = friend
    self.isNew = isNew
  }

  var body: some View {
    Form {
      TextField("Name", text: $friend.name)
        .autocorrectionDisabled()
      Picker("Favorite Movie", selection: $friend.favoriteMovie) {
        Text("None")
          .tag(nil as Movie?)

        ForEach(movies) { movie in
          Text(movie.title)
            .tag(movie)
        }
      }
//      .pickerStyle(.menu)
    }
    .navigationTitle(isNew ? "New Friend" : "Friend")
    .navigationBarTitleDisplayMode(.inline)
    .toolbar {
      if isNew {
        ToolbarItem {
          Button("Save") {
            dismiss()
          }
        }
        ToolbarItem(placement: .cancellationAction) {
          Button("Cancel") {
            context.delete(friend)
            dismiss()
          }
        }
      }
    }
  }
}

#Preview {
  NavigationStack {
    FriendDetailView(friend: SampleData.shared.friend)
  }
  .modelContainer(SampleData.shared.modelContainer)
}

#Preview("New Friend") {
  NavigationStack {
    FriendDetailView(friend: SampleData.shared.friend, isNew: true)
  }
}
