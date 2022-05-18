// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import XCTest
import Combine
@testable import GitHubModel

class GitHubAPITests: XCTestCase {

    @Published var userName: String = "jonathanlehr"
    
    var subscription: AnyCancellable?
    var userNameSubscription: AnyCancellable?
    var networkActivitySubscription: AnyCancellable?
    
    var backgroundQueue: DispatchQueue = DispatchQueue(label: "myBackgroundQueue")
    
    func testFetchUser() {
        let expectation = XCTestExpectation()
        
        networkActivitySubscription = GitHubAPI.networkActivityPublisher
            .receive(on: RunLoop.main)
            .sink { isActive in
                if (isActive) {
                    print("Network activity started...")
                } else {
                    print("Network activity stopped.")
                }
            }
        
        userNameSubscription = $userName
            .throttle(for: 0.5, scheduler: backgroundQueue, latest: true)
            .removeDuplicates()
            .map { name -> AnyPublisher<[GitHubUser], Never> in
                return GitHubAPI.gitHubUserPublisher(userName: name)
            }
            // Flatten from Publisher to fetched objects.
            .switchToLatest()
            .receive(on: RunLoop.main)
            .sink(receiveValue: { users in
                print(users)
                expectation.fulfill()
            })
        
        wait(for: [expectation], timeout: 1)
    }
    
    func testSearchRepositories() {
        let expectation = XCTestExpectation()
        var subscriptions = Set<AnyCancellable>()
        
        GitHubAPI.repositoriesPublisher(query: "SwiftUI", pageNumber: 1)
            .sink { completion in
                print(completion)
            } receiveValue: { repos in
                print(repos)
                expectation.fulfill()
            }
            .store(in: &subscriptions)
        
        wait(for: [expectation], timeout: 1)
    }
}
