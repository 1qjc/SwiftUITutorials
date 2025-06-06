//
//  MovieDetailView.swift
//  TheTutorial
//
//  Created by 1qjc on 6/6/25.
//

import SwiftUI

struct MovieDetailView: View {
  @Bindable var movie: Movie
  let isNew: Bool

  @Environment(\.dismiss) private var dismiss
  @Environment(\.modelContext) private var context

  init(movie: Movie, isNew: Bool = false) {
    self.movie = movie
    self.isNew = isNew
  }

  var sortedFriends: [Friend] {
    movie.favoritedBy.sorted { f, s in
      f.name < s.name
    }
  }
  
  var body: some View {
    Form {
      TextField("Movie title", text: $movie.title)
      DatePicker(
        "Release date",
        selection: $movie.releaseDate,
        displayedComponents: .date
      )

      if !sortedFriends.isEmpty {
        Section("Favorite by") {
          ForEach(sortedFriends) { friend in
            Text(friend.name)
          }
          // not hide title when delete last one
          .onDelete(perform: deleteFavorite(indexes:))
        }
      }
    }
    .toolbar {
      if isNew {
        ToolbarItem {
          Button("Save") {
            dismiss()
          }
        }
        ToolbarItem(placement: .cancellationAction) {
          Button("Cancel") {
            context.delete(movie)
            dismiss()
          }
        }
      }
    }
    .navigationTitle("Movie")
    .navigationBarTitleDisplayMode(.inline)
  }
  
  private func deleteFavorite(indexes: IndexSet) {
    for index in indexes {
      sortedFriends[index].favoriteMovie = nil
    }
  }
}

#Preview("New Movie") {
  NavigationStack {
    MovieDetailView(movie: SampleData.shared.movie)
  }
}

#Preview {
  NavigationStack {
    MovieDetailView(movie: SampleData.shared.movie, isNew: true)
  }
}
