//
//  PickAPalView.swift
//  TheTutorial
//
//  Created by 1qjc on 6/4/25.
//

import SwiftUI

struct PickAPalView: View {
  @State private var names: [String] = [
    "1qjc", "Andre", "Jasmine", "Po-Chun", "Elisha", "Andre",
  ]
  @State private var nameToAdd = ""
  @State private var pickedName = ""
  @State private var shouldRemovePickedName = false

  var body: some View {
    VStack {
      VStack(spacing: 8) {
        Image(systemName: "person.3.sequence.fill")
          .foregroundStyle(.tint)
          .symbolRenderingMode(.hierarchical)
        Text("Pick-a-Pal")
      }
      .font(.title)
      .bold()

      Text(pickedName.isEmpty ? " " : pickedName)
        .font(.title2)
        .bold()
        .foregroundStyle(.tint)

      List {
        ForEach(names, id: \.description) { name in
          Text(name)
        }
      }.listStyle(.plain)

      TextField("Add Name", text: $nameToAdd)
        .autocorrectionDisabled()
        .onSubmit {
          let add = nameToAdd.trimmingCharacters(in: .whitespacesAndNewlines)
          if !add.isEmpty
            && !names.contains(where: { name in
              name == add
            })
          {
            names.append(add)
            nameToAdd = ""
          } else {
            nameToAdd = "???"
          }
        }

      Divider()

      Toggle("Remove when picked", isOn: $shouldRemovePickedName)
        .padding(.bottom, 8)

      Button {
        if let randomName = names.randomElement() {
          pickedName = randomName

          if shouldRemovePickedName {
            names.removeAll { name in
              name == randomName
            }
          }
        } else {
          pickedName = ""
        }
      } label: {
        Text("Pick Random Name")
          .padding(.vertical, 4)
          .padding(.horizontal, 12)
      }.buttonStyle(.borderedProminent)
        .font(.title2)
    }
    .padding()
  }
}

#Preview {
  PickAPalView()
}
