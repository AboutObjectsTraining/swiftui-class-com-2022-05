// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import Foundation
import Combine

enum APIError: Error {
    case invalidServerResponse
}

public struct GitHubAPI
{
    /// Publishes network activity status.
    public static let networkActivityPublisher = PassthroughSubject<Bool, Never>()
    
    /// Returns a one-shot publisher for a `GitHubUser` object. The
    /// value is encapsulated in an array that either contains a single user
    /// or is empty. We're using an array here to avoid returning an instance
    /// of `Optional`, which could be trickier to work with in a pipeline
    /// connected to an `@Published` data source.
    ///
    /// - Parameter userName: name of a user to be fetched from GitHub
    /// - Returns: a one-shot publisher of a GitHub user fetched via the API
    
    static func gitHubUserPublisher(userName: String) -> AnyPublisher<[GitHubUser], Never> {
        
        guard let url = URL(gitHubUserName: userName), userName.count > 2 else {
            return Just([]).eraseToAnyPublisher()
        }
        
        let publisher = URLSession.shared.dataTaskPublisher(for: url)
            .handleEvents(
                receiveSubscription: { _ in networkActivityPublisher.send(true) },
                receiveCompletion: { _ in networkActivityPublisher.send(false) },
                receiveCancel: { networkActivityPublisher.send(false) })
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.isValid else {
                    throw APIError.invalidServerResponse
                }
                return data
            }
            .decode(type: GitHubUser.self, decoder: JSONDecoder())
            .map { [$0] }
            .replaceError(with: [])
            .eraseToAnyPublisher()
        
        return publisher
    }
}

extension GitHubAPI
{
    public static var pageSize = 5
    
    public static func repositoriesPublisher(query: String, pageNumber: Int) -> AnyPublisher<[GitRepository], Error>
    {
        guard let url = URL(gitHubQuery: query, pageSize: Self.pageSize, pageNumber: pageNumber) else {
            fatalError("Unable to create URL with query \(query)")
        }
        
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .handleEvents(
                receiveSubscription: { _ in networkActivityPublisher.send(true) },
                receiveCompletion: { _ in networkActivityPublisher.send(false) },
                receiveCancel: { networkActivityPublisher.send(false) })
            .tryMap { try JSONDecoder().decode(GitHubSearchResult<GitRepository>.self,
                                               from: $0.data).items }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

