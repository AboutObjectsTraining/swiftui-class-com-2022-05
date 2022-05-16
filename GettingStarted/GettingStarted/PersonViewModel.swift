import SwiftUI

struct Person {
    var name: String
    var age: Int
}

final class PersonViewModel: ObservableObject {
    @Published var person: Person?
    
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
