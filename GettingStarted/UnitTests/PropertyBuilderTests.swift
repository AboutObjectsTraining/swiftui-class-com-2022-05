// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import XCTest

class PropertyBuilderTests: XCTestCase {
    
@StringBuilder var message: String {
    "Hello"
    " "
    "World"
    "!"
}
    
    func testStringBuilder() {
        let group = StringGroup {
            "Hello"
            " "
            "World"
            "!"
        }
// The following prints "Hello World!"
print(group.text)
    }
    
    func testStringBuilderProperty() {
        print(message)
    }
}


@resultBuilder struct StringBuilder {

    static func buildBlock(_ components: String...) -> String {
        components.joined(separator: "")
    }
}

struct StringGroup {
    var text: String
    
    init(@StringBuilder builder: () -> String) {
        text = builder()
    }
}
