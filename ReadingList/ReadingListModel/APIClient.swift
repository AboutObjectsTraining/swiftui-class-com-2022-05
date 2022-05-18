// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import Foundation
import Combine

public class APIClient {
    
    var subscription: AnyCancellable?
    
    public func fetchReadingList(from url: URL, handler: @escaping (ReadingList) -> Void) {
        subscription = readingListPublisher(from: url)
            .sink { status in
                print(status)
            } receiveValue: { readingList in
                handler(readingList)
            }
    }
    
    public func readingListPublisher(from url: URL) -> AnyPublisher<ReadingList, Never> {
        
        URLSession.shared
            .dataTaskPublisher(for: url)
            .map { data, _ in
                data
            }
            .decode(type: ReadingList.self, decoder: JSONDecoder())
            .replaceError(with: ReadingList())
            .eraseToAnyPublisher()
    }
}
