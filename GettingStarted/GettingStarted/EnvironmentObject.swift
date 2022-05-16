// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

struct EnvironmentObjectView: View {
    @StateObject private var personViewModel = PersonViewModel()
    
    var body: some View {
        TabView {
            PersonView_3()
                .tabItem {
                    Image(systemName: "person")
                    Text("Person Form")
                }
            PersonView_4()
                .tabItem {
                    Image(systemName: "person.2")
                    Text("Person Stack")
                }
        }
        .environmentObject(personViewModel)
    }
}

struct PersonView_3: View {
    @EnvironmentObject var viewModel: PersonViewModel
    
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

struct PersonView_4: View {
    @EnvironmentObject var viewModel: PersonViewModel
    
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

struct EnvironmentObject_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObjectView()
    }
}
