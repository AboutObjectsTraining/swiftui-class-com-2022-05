// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI
import ReadingListModel

final class ReadingListViewModel: ObservableObject {
    private let dataStore: DataStore
    
    @Published var readingList = ReadingList()
    
    init(dataStore: DataStore = DataStore()) {
        self.dataStore = dataStore
    }
}

// MARK: - Intents
extension ReadingListViewModel {
    
    func loadReadingListIfEmpty() {
        if readingList.isEmpty {
            // FIXME: Error handling
            readingList = try! dataStore.fetch()
        }
    }
}
