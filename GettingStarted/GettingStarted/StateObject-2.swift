// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI
import Combine

final class PeopleViewModel: ObservableObject {
    @Published var people: [Person] = []
    @Published var averageAge: Int = 0
    
    private var subscriptions: Set<AnyCancellable> = []
    
    init() {
        loadPeople()
        
        $people
            .sink { people in
                let sumOfAges = people.reduce(0) { $0 + $1.age }
                self.averageAge = people.count == 0 ? 0 : sumOfAges / people.count
            }
            .store(in: &subscriptions)
    }
    
    private func loadPeople() {
        people = values.map { Person(name: $0.0, age: $0.1) }
    }
}

struct PeopleView: View {
    @StateObject var viewModel = PeopleViewModel()
    
    var body: some View {
        Form {
            Button(action: change, label: { Text("Change") })
            
            ForEach(viewModel.people, id: \.name) { person in
                HStack {
                    Text("\(person.name)")
                    Spacer()
                    Text("Age: \(person.age)")
                }
            }
            HStack {
                Spacer()
                Text("Average age: \(viewModel.averageAge)")
            }
        }
    }
    
    func change() {
        if !viewModel.people.isEmpty {
            viewModel.people.remove(at: 0)
        }
    }
}

struct Observables_2_Previews: PreviewProvider {
    static var previews: some View {
        PeopleView()
    }
}
