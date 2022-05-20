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
            ReadingListCell(book: book)
                .environmentObject(viewModel)
        }
        .listStyle(.grouped)
        .navigationTitle(viewModel.readingList.title)
        .toolbar {
            Button(action: editTitle,
                   label: { Image(systemName: "square.and.pencil") })
        }
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
        .task { await loadReadingList() }
        //        .onAppear(perform: loadReadingList)
        .fullScreenCover(isPresented: $viewModel.isEditingTitle,
                         content: { EditTitleView(viewModel: viewModel) })
        //        .sheet(isPresented: $viewModel.isEditingTitle,
        //               content: { EditTitleView(viewModel: viewModel) })
        .alert("Unable to load reading list.",
               isPresented: $viewModel.loadFailed) {
            Button("Okay", role: .cancel, action: {})
        }
    }
}

// MARK: - Actions
extension ReadingListView {
    
    private func editTitle() {
        viewModel.isEditingTitle = true
    }
    
    //    private func loadReadingList() {
    //        viewModel.loadReadingListIfEmpty()
    //    }
    
    private func loadReadingList() async {
        await viewModel.loadReadingListIfEmpty()
    }
}

#if DEBUG
struct ReadingListView_Previews: PreviewProvider {
    static var previews: some View {
        ReadingListView(viewModel: .preloaded)
        ReadingListView(viewModel: .preloaded)
            .preferredColorScheme(.dark)
        ReadingListView(viewModel: .preloaded)
            .environment(\.sizeCategory, .accessibilityLarge)
        
    }
}
#endif
