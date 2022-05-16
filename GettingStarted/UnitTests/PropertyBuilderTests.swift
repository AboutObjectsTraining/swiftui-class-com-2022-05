// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import XCTest

@resultBuilder struct StringBuilder {
    
    static func buildBlock(_ components: String...) -> String {
        components.joined(separator: "")
    }
}

class PropertyBuilderTests: XCTestCase {
    
    @StringBuilder var message: String {
        "Hello"
        " "
        "World"
        "!"
    }
    
    func testStringBuilderProperty() {
        print(message)
    }
}


struct StringGroup {
    var text: String
    
    init(@StringBuilder builder: () -> String) {
        text = builder()
    }
}

extension PropertyBuilderTests {
    
    func testStringBuilder() {
        let group = StringGroup {
            "Hello"
            " "
            "World"
            "!"
        }
        
        // prints "Hello World!"
        print(group.text)
    }
}
