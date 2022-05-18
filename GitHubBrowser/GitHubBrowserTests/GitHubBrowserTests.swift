// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import XCTest
import GitHubBrowser
import Combine

class GitHubBrowserTests: XCTestCase {
    var subscription: AnyCancellable?

    func testPerformBatchedSearch() {
        let expectation = XCTestExpectation()
        let viewModel = RepositoriesViewModel()
        
        viewModel.performBatchedSearch()
        viewModel.performBatchedSearch()
        
        subscription = viewModel.$context.sink { state in
            print("Page number: \(state.pageNumber)")
            print(state.repositories)
            if (state.pageNumber > 2) { expectation.fulfill() }
        }
        
        wait(for: [expectation], timeout: 1)
    }
}
