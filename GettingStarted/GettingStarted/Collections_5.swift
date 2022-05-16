// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

struct Collections_5: View {
    @StateObject private var viewModel = PeopleViewModel()
    
    var body: some View {
        List(viewModel.people, id:\.name) { person in
            HStack {
                Image(systemName: "person.fill")
                Text(person.name)
                Spacer()
                Text("Age: \(person.age.description)")
            }
        }
    }
}

struct Collections_5_Previews: PreviewProvider {
    static var previews: some View {
        Collections_5()
    }
}
