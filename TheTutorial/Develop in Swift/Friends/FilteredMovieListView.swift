//
//  FilteredMovieListView.swift
//  TheTutorial
//
//  Created by 1qjc on 6/6/25.
//

import SwiftUI

struct FilteredMovieListView: View {
  @State private var searchText = ""

  
  var body: some View {
    NavigationSplitView {
      MovieListView(titleFilter: searchText)
        .searchable(text: $searchText)
    } detail: {
      Text("Select a movie")
        .navigationTitle("Movie")
        .navigationBarTitleDisplayMode(.inline)
    }
  }
}

#Preview {
  FilteredMovieListView()
    .modelContainer(SampleData.shared.modelContainer)

}
