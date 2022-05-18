// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI
import ReadingListModel
import Combine

final class ReadingListViewModel: ObservableObject {
    private let dataStore: DataStore
    
    @Published var readingList = ReadingList()
    @Published var isEmpty = true
    @Published var loadFailed = false
    
    private var subscriptions: Set<AnyCancellable> = []
    
    init(dataStore: DataStore = DataStore()) {
        self.dataStore = dataStore
        
        configurePublishers()
    }
    
    private func configurePublishers() {
        $readingList
            .sink { [weak self] readingList in
                self?.isEmpty = readingList.isEmpty
            }
            .store(in: &subscriptions)

    }
}

// MARK: - Intents
extension ReadingListViewModel {
    
    func loadReadingListIfEmpty() {
        if readingList.isEmpty {
            loadFailed = false
            do {
                readingList = try dataStore.fetch()
            } catch {
                loadFailed = true
            }
        }
    }
}
