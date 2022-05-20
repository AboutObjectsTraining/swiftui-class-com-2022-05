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
        
    func updateBook(_ book: Book) {
        guard let index = readingList.books.firstIndex(where: { $0.id == book.id }) else { return }
        readingList.books[index] = book
    }
    
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

extension Book {
    
    var artworkUrl: URL {
        let title = title.trimmingCharacters(in: .whitespaces)
        let path = Bundle.main.path(forResource: title, ofType: "jpg") ?? ""
        return URL(fileURLWithPath: path)
    }
}


#if DEBUG
extension ReadingListViewModel {
    
    static var preloaded: ReadingListViewModel = {
        let viewModel = ReadingListViewModel()
        viewModel.readingList = try! viewModel.dataStore.fetch()
        return viewModel
    }()

    static var testBookWithoutCover = Book(title: "My Book",
                                           year: 1999,
                                           author: Author(firstName: "Fred",
                                                          lastName: "Smith"))

    static var testBookWithCover = Book(title: "Julius Caesar",
                                           year: 1999,
                                           author: Author(firstName: "William",
                                                          lastName: "Shakespeare"))
}
#endif
