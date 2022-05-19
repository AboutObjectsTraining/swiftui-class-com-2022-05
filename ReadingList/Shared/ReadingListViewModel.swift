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
    @Published var isEditingTitle = false
    
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
    
    func finishedEditingTitle(_ title: String) {
        readingList.title = title
        isEditingTitle = false
    }
    
    func cancelEditingTitle() {
        isEditingTitle = false
    }
    
    @MainActor func loadReadingListIfEmpty() async {
        if readingList.isEmpty {
            loadFailed = false
            do {
                readingList = try await dataStore.fetch()
            } catch {
                loadFailed = true
            }
        }
    }
    
//    func loadReadingListIfEmpty() {
//        Task {
//            if readingList.isEmpty {
//                loadFailed = false
//                do {
//                    readingList = try await dataStore.fetch()
//                } catch {
//                    loadFailed = true
//                }
//            }
//        }
//    }
}
