// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

struct Combine: View {
    var body: some View {
        PersonEditingView_1()
    }
}

struct PersonEditingView_1: View {
    @StateObject private var viewModel = PersonViewModel_4()
    
    var body: some View {
        Form {
            TextField("Name", text: $viewModel.person.name)
            HStack {
                Text("Name:")
                Text("\(viewModel.person.name)")
            }
        }
    }
}

struct PersonEditingView_2: View {
    @StateObject private var viewModel = PersonViewModel_4_1()
    
    var body: some View {
        Form {
            TextField("Name", text: $viewModel.name)
            HStack {
                Text("Name:")
                Text("\(viewModel.uppercasedName)")
            }
        }
    }
}


struct Combine_Previews: PreviewProvider {
    static var previews: some View {
        PersonEditingView_2()
        PersonEditingView_1()
    }
}
