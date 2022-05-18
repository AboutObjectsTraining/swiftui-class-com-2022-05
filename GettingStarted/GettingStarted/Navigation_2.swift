// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

struct Navigation_2: View {
    @StateObject private var viewModel = PeopleViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.people, id: \.name) { person in
                    NavigationLink(person.name) {
                        PersonCell(person: person)
                    }
                }
                .onDelete { indexSet in
                    delete(at: indexSet)
                }
                .onMove { indexSet, toIndex in
                    
                }
            }
            .navigationTitle("People")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}, label: { Image(systemName: "plus.circle") })
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
        }
    }
    
    private func add() {
        // ...
    }
    
    private func delete(at indexSet: IndexSet) {
        // NOTE: ideally, this behavior would be in the view model.
        viewModel.people.remove(at: indexSet.first ?? 0)
    }
}

struct PersonCell: View {
    let person: Person
    
    var body: some View {
        Form {
            Text("Name: \(person.name)")
            Text("Age: \(person.age)")
        }
        .navigationTitle("Selected Person")
    }
}

struct Navigation_2_Previews: PreviewProvider {
    static var previews: some View {
        Navigation_2()
    }
}
