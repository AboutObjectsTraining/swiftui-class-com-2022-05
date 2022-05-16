// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

struct EditingTextView: View {
    @StateObject private var personViewModel = PersonViewModel_2()
    
    var body: some View {
        TabView {
            TextFieldBasicsView()
                .tabItem {
                    Image(systemName: "text.bubble.fill")
                    Text("Basics")
                }
            EditablePersonView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Editable Person")
                }
            TextEditingView()
                .tabItem {
                    Image(systemName: "person.2")
                    Text("Person Stack")
                }
        }
        .environmentObject(personViewModel)
    }
}

struct TextFieldBasicsView: View {
    @State private var message = ""
    
    var body: some View {
        Form {
            TextField("Message", text: $message)
            Text("Message is: \(message)")
        }
    }
}

struct EditablePersonView: View {
    @EnvironmentObject private var viewModel: PersonViewModel_2
    
    var body: some View {
        Form {
            TextField("Name", text: $viewModel.name)
            HStack {
                Text("Name:")
                Text("\(viewModel.person?.name ?? "unknown")")
            }
       }
    }
}

struct TextEditingView: View {
    var body: some View {
        EmptyView()
    }
}

struct EditingText_Previews: PreviewProvider {
    static var previews: some View {
        EditingTextView()
    }
}
