// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

struct Contact: Identifiable, Hashable {
    let id = UUID()
    var name: String
}

struct Collections_2: View {
    let contacts: [Contact] = [
        Contact(name: "Jill Smith"),
        Contact(name: "Jan Brown"),
        Contact(name: "Bob Jones"),
    ]
    
    var body: some View {
        VStack {
            ForEach(contacts) { contact in
                Text(contact.name)
            }
        }
    }
}

struct Collections_2_Previews: PreviewProvider {
    static var previews: some View {
        Collections_2()
    }
}
