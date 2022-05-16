// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

struct ObservedObjectView: View {
    @StateObject private var personViewModel = PersonViewModel()
    
    var body: some View {
        TabView {
            PersonView_1(viewModel: personViewModel)
                .tabItem {
                    Image(systemName: "person")
                    Text("Person Form")
                }
            PersonView_2(viewModel: personViewModel)
                .tabItem {
                    Image(systemName: "person.2")
                    Text("Person Stack")
                }
        }
    }
}

struct PersonView_1: View {
    @ObservedObject var viewModel: PersonViewModel
    
    var body: some View {
        Form {
            HStack {
                Text("Name:")
                Text("\(viewModel.person?.name ?? "unknown")")
            }
            HStack {
                Text("Age:")
                Text("\(viewModel.person?.age ?? 0)")
            }
            HStack {
                Spacer()
                Button(action: change, label: { Text("Change") })
                    .buttonStyle(.borderedProminent)
            }
        }
    }
    
    func change() {
        let (name, age) = values[Int.random(in: 0..<values.count)]
        viewModel.change(name: name, age: age)
    }
}

struct PersonView_2: View {
    @ObservedObject var viewModel: PersonViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Name:")
                Text("\(viewModel.person?.name ?? "unknown")")
            }
            HStack {
                Text("Age:")
                Text("\(viewModel.person?.age ?? 0)")
            }
        }
    }
}

struct ObservedObject_Previews: PreviewProvider {
    static var previews: some View {
        ObservedObjectView()
    }
}
