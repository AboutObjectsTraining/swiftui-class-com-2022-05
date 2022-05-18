// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI
import GitHubModel

struct RepositoriesView: View {
    @ObservedObject var viewModel: RepositoriesViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(viewModel.context.repositories) { repo in
                        RepositoryCell(repo: repo, viewModel: viewModel)
                    }
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Repositories")
                .navigationBarItems(leading: editQueryButton, trailing: searchButton)
                .onAppear(perform: viewModel.performBatchedSearch)
                .layoutPriority(2)

                if viewModel.isFetching {
                    ProgressView()
                        .scaleEffect(2)
                }
            }
        }
        .sheet(isPresented: $viewModel.isShowingQueryView,
               onDismiss: { },
               content: { QueryView(viewModel: viewModel) })
    }
    
    private var searchButton: some View {
        Button(action: performSearch,
               label: {  Text("Next").fontWeight(.semibold) })
    }
    
    private var editQueryButton: some View {
        Button(action: showQueryView,
               label:  { Image.search })
        .font(.system(size: 20))
    }
}

// MARK: - Intents
extension RepositoriesView {
    
    private func showQueryView() {
        viewModel.showQueryView()
    }
    
    private func performSearch() {
        viewModel.search()
    }
}

struct RepositoriesView_Previews: PreviewProvider {
    static var previews: some View {
        // TODO: Static list of repos for previews
        RepositoriesView(viewModel: RepositoriesViewModel())
    }
}

