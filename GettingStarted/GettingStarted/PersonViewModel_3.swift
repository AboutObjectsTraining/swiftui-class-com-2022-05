// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

final class PersonViewModel_3: ObservableObject {
    
    @Published var person: Person = Person(name: "Fred Smith", age: 32)
        
    func change(name: String, age: Int) {
        person.name = name
        person.age = age
    }
}
