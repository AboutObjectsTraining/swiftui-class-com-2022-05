// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import Combine
import GitHubModel

public class RepositoriesViewModel: ObservableObject
{
    public struct Context {
        public var repositories: [GitRepository] = []
        public var pageNumber = 1
        public var canLoadNextPage = true
    }
    
    @Published public private(set) var context = Context()
    @Published var queryText = "SwiftUI"
    @Published var isShowingQueryView = false
    @Published var isFetching = false
    
    private var subscriptions = Set<AnyCancellable>()
    private var networkActivitySubscription: AnyCancellable?
    
    public init() {
        networkActivitySubscription = GitHubAPI.networkActivityPublisher
            .receive(on: RunLoop.main)
            .sink { isFetching in
                self.isFetching = isFetching
            }
    }
}

// MARK: - Intents
extension RepositoriesViewModel {
    
    func showQueryView() {
        isShowingQueryView = true
    }
    
    func dismissQueryView() {
        isShowingQueryView = false
    }
    
    func search() {
        clear()
        performBatchedSearch()
    }
    
    func newSearch() {
        context = Context()
        search()
    }
    
    func clear() {
        subscriptions = []
        context.repositories = []
    }
    
    public func performBatchedSearch() {
        guard context.canLoadNextPage else { return }
        
        GitHubAPI.repositoriesPublisher(query: queryText, pageNumber: context.pageNumber)
            .sink(receiveCompletion: batchedSearchCompletionHandler,
                  receiveValue: batchedSearchValueHandler)
            .store(in: &subscriptions)
    }
    
    private func batchedSearchCompletionHandler(_ completion: Subscribers.Completion<Error>) {
        switch completion {
            case .failure:  context.canLoadNextPage = false
            case .finished: break
        }
    }
    
    private func batchedSearchValueHandler(_ repositories: [GitRepository]) {
        context.repositories += repositories
        context.pageNumber += 1
        context.canLoadNextPage = repositories.count == GitHubAPI.pageSize
        
        objectWillChange.send()
    }
}
