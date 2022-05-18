// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI
import GitHubModel

struct RepositoryCell: View {
    var repo: GitRepository
    var viewModel: RepositoriesViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(repo.name)
//                    .onAppear {
//                        if self.viewModel.context.repositories.last == repo {
//                            self.viewModel.performBatchedSearch()
//                        }
//                    }
                    .layoutPriority(1)
                    .font(.headline)
                Spacer()
                NavigationLink(destination: WebView(url: repo.htmlUrl)) {
                    Text("")
                }
            }
            .padding(.top, 2)
            Spacer()
            Text(repo.description ?? "")
                .padding(.bottom, 6.0)
                .font(.subheadline)
            HStack(spacing: 18) {
                CountView(image: .star, name: "stars", count: repo.starsCount)
                CountView(image: .fork, name: "forks", count: repo.forksCount)
                Spacer()
            }
            .padding(.bottom, 8)
            .foregroundColor(.secondary)
            .font(.system(size: 13, weight: .semibold))
        }
    }
}

struct CountView: View {
    var image: Image
    var name: String
    var count: Int
    
    var body: some View {
        HStack(spacing: 0) {
            image
                .foregroundColor(.purple)
                .padding(.trailing, 6)
            Text("\(count)")
            Text(" \(name)")
                .font(.system(size: 13, weight: .regular))
        }
    }
}

struct RepositoryCell_Previews: PreviewProvider {
    static let repo = GitRepository(id: 1,
                                    name: "SwiftUI Fu",
                                    description: "Yet another awesome SwiftUI GitHub repo. SwiftUI FTW!")
    
    static var previews: some View {
        Form {
            RepositoryCell(repo: repo, viewModel: RepositoriesViewModel())
        }
        .previewLayout(.fixed(width: 420, height: 180))
    }
}
