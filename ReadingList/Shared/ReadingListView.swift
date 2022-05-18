// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

struct ReadingListView: View {
    @StateObject var viewModel = ReadingListViewModel()
    
    private var emptyView: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .fill(.tertiary).opacity(0.5)
            Text("There currently aren't any books in this reading list.")
                .navigationTitle("My Reading List")
                .font(.title2.italic())
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
                .padding(.top, 120)
        }
    }
    
    private var listView: some View {
        List(viewModel.readingList.books) { book in
            Text(book.title)
        }
        .navigationTitle(viewModel.readingList.title)
    }
    
    var body: some View {
        NavigationView {
            // TODO: Make isEmpty a publisher
            if viewModel.readingList.books.isEmpty {
                emptyView
            } else {
                listView
            }
        }
        .onAppear(perform: loadReadingList)
    }
}

// MARK: - Actions
extension ReadingListView {
    
    private func loadReadingList() {
        viewModel.loadReadingListIfEmpty()
    }
}

struct ReadingListView_Previews: PreviewProvider {
    static var previews: some View {
        ReadingListView()
        ReadingListView()
            .preferredColorScheme(.dark)
        ReadingListView()
            .environment(\.sizeCategory, .accessibilityExtraExtraLarge)

    }
}
