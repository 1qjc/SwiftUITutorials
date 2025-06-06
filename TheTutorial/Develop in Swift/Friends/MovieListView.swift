//
//  MovieListView.swift
//  TheTutorial
//
//  Created by 1qjc on 6/5/25.
//

import SwiftData
import SwiftUI

struct MovieListView: View {
  @Query(sort: \Movie.title) private var movies: [Movie]
  @Environment(\.modelContext) private var context
  @State private var newMovie: Movie?

  init(titleFilter: String = "") {
    let predicate = #Predicate<Movie> { movie in
      titleFilter.isEmpty || movie.title.localizedStandardContains(titleFilter)
    }
    _movies = Query(filter: predicate, sort: \Movie.title)
  }

  var body: some View {
    //    NavigationSplitView {
    Group {
      if !movies.isEmpty {
        List {
          ForEach(movies) { movie in
            NavigationLink(movie.title) {
              MovieDetailView(movie: movie)
                //            Text(movie.releaseDate, format: .dateTime.month(.wide).day().year())
                .navigationTitle("Movie")
                .navigationBarTitleDisplayMode(.inline)
            }
          }.onDelete(perform: deleteMovies(indexes:))
        }
      } else {
        ContentUnavailableView("Add Movies", systemImage: "film.stack")
      }
    }
    .navigationTitle("Movies")
    .toolbar {
      ToolbarItem {
        Button("Add movie", systemImage: "plus", action: addMovie)
      }
      ToolbarItem {
        EditButton()
      }
    }
    .sheet(item: $newMovie) { movie in
      NavigationStack {
        MovieDetailView(movie: movie, isNew: true)
      }
      .interactiveDismissDisabled()
    }
    //    } detail: {
    //      Text("Select a movie")
    //        .navigationTitle("Movie")
    //        .navigationBarTitleDisplayMode(.inline)
    //    }
  }

  private func addMovie() {
    let newMovie = Movie(title: "New Movie", releaseDate: .now)
    context.insert(newMovie)
    self.newMovie = newMovie
  }

  private func deleteMovies(indexes: IndexSet) {
    for index in indexes {
      context.delete(movies[index])
    }
  }
}

#Preview {
  NavigationStack {
    MovieListView()
      .modelContainer(SampleData.shared.modelContainer)
  }
}

#Preview("Filtered") {
  NavigationStack {
    MovieListView(titleFilter: "Amu")
      .modelContainer(SampleData.shared.modelContainer)
  }
}

#Preview("Empty List") {
  NavigationStack {
    MovieListView()
      .modelContainer(for: Movie.self, inMemory: true)
  }
}
