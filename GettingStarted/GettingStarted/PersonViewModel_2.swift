// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

final class PersonViewModel_2: ObservableObject {
    @Published var person: Person?
    
    @Published var name: String = "" {
        didSet { person?.name = name }
    }
    
    init() {
        loadPerson()
    }
    
    // Simulated fetch
    private func loadPerson() {
        person = Person(name: "Fred Smith", age: 30)
    }
    
    // Actions (intents)
    
    func change(name: String, age: Int) {
        person?.name = name
        person?.age = age
    }
}
