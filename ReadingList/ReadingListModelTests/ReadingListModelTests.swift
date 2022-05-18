// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import XCTest
@testable import ReadingListModel

class ReadingListModelTests: XCTestCase {
    
    func testLoadReadingList() throws {
        let store = DataStore(bundle: Bundle(for: DataStore.self))
        let readingList = try store.fetch()
        print(readingList)
    }

}
