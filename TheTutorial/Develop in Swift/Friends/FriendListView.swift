//
//  FriendListView.swift
//  TheTutorial
//
//  Created by 1qjc on 6/5/25.
//

import SwiftData
import SwiftUI

struct FriendListView: View {
  @Query(sort: \Friend.name) private var friends: [Friend]
  @Environment(\.modelContext) private var context
  @State private var newFriend: Friend?

  var body: some View {
    NavigationSplitView {
      Group {
        if !friends.isEmpty {
          List {
            ForEach(friends) { friend in
              NavigationLink(friend.name) {
                FriendDetailView(friend: friend)
                  .navigationTitle("Friend")
                  .navigationBarTitleDisplayMode(.inline)
              }
            }.onDelete(perform: deleteFriends(indexes:))
          }
        } else {
          ContentUnavailableView {
            Label("Add Friends", systemImage: "person.and.person")
          } description: {
            Text("New friend you add will appear here.")
          }
        }
      }
      .navigationTitle("Friends")
      .toolbar {
        ToolbarItem {
          Button("Add friend", systemImage: "plus", action: addFriend)
        }
        ToolbarItem(placement: .topBarTrailing) {
          EditButton()
        }
      }
      .sheet(item: $newFriend) { friend in
        NavigationStack {
          FriendDetailView(friend: friend, isNew: true)
        }
        .interactiveDismissDisabled()
      }
    } detail: {
      Text("Select a friend")
        .navigationTitle("Friend")
        .navigationBarTitleDisplayMode(.inline)
    }
  }

  private func addFriend() {
    let newFriend = Friend(name: "")
    context.insert(newFriend)
    self.newFriend = newFriend
  }
  private func deleteFriends(indexes: IndexSet) {
    for index in indexes {
      context.delete(friends[index])
    }
  }
}

#Preview {
  FriendListView()
    .modelContainer(SampleData.shared.modelContainer)
}

#Preview("Empty List") {
  FriendListView()
    .modelContainer(for: Friend.self, inMemory: true)
}
