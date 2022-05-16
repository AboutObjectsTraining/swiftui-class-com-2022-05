// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

let contacts: [Contact] = [
    Contact(name: "Jill Smith"),
    Contact(name: "Jan Brown"),
    Contact(name: "Bob Jones"),
]

struct Collections_4: View {
    var body: some View {
        List(contacts) { contact in
            Text(contact.name)
        }
    }
}

struct Collections_4_1: View {
    @State private var selections: Set<UUID> = []
        
    var body: some View {
        NavigationView {
            List(contacts, selection: $selections) { contact in
                Text(contact.name)
            }
            .navigationTitle("Contacts")
            .toolbar { EditButton() }
        }
    }
}

struct Collections_4_Previews: PreviewProvider {
    static var previews: some View {
        Collections_4()
        Collections_4_1()
    }
}
