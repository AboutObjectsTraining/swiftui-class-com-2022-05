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
                .navigationTitle("Reading List")
                .font(.title2.italic())
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
                .padding(.top, 180)
        }
        .edgesIgnoringSafeArea(.bottom)
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
            if viewModel.isEmpty {
                emptyView
            } else {
                listView
            }
        }
        .onAppear(perform: loadReadingList)
        .alert("Unable to load reading list.",
               isPresented: $viewModel.loadFailed) {
            Button("Okay", role: .cancel, action: {})
        }
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
