// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI
import Combine

final class PersonViewModel_4: ObservableObject {
    @Published var person: Person = Person(name: "Fred Smith", age: 32)
    
    private var subscriptions: Set<AnyCancellable> = []
    
    init() {
        $person
            .sink { person in
                print(person.name)
            }
            .store(in: &subscriptions)
    }
}

final class PersonViewModel_4_1: ObservableObject {
    @Published var person: Person = Person(name: "Jan", age: 33)
    @Published var name: String = "" {
        didSet { person.name = name }
    }
    @Published var uppercasedName: String = ""

    private var subscriptions: Set<AnyCancellable> = []
    private let characterSet = CharacterSet.whitespaces.union(CharacterSet.letters)
    
    init() {
        name = person.name
        
        $name
            .debounce(for: 1, scheduler: RunLoop.main)
            .filter { text in
                text.unicodeScalars.allSatisfy {
                    self.characterSet.contains($0)
                }
            }
            .map { text in
                text.uppercased()
            }
            .sink { text in
                print(text)
                self.uppercasedName = text
            }
            .store(in: &subscriptions)
    }
}
