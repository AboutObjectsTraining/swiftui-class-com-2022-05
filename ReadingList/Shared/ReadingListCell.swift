// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI
import ReadingListModel

struct ReadingListCell: View {
    @EnvironmentObject var viewModel: ReadingListViewModel
    let book: Book
    
    private var overview: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(book.title)
                .font(.headline)
                .foregroundColor(.green)
            
            HStack {
                Text(book.year.description)
                Text(book.author.fullName)
            }
            .font(.subheadline)
            .foregroundColor(.secondary)
        }
    }
    
    var body: some View {
        HStack(spacing: 18) {
            ThumbnailImage(url: book.artworkUrl)
            
            overview
                .layoutPriority(1)
            
            NavigationLink("") {
                // TODO: Implement detail view
                BookDetail(book: book)
                    .environmentObject(viewModel)
//                Text(book.title)
                    .navigationTitle("Book Detail")
            }
        }
        .listRowBackground(Color.brown.opacity(0.1))
    }
}

struct ThumbnailImage: View {
    @Environment(\.colorScheme) var colorScheme
    let url: URL
    
    private var missingArtworkImage: some View {
        ZStack {
            Color.red
                .frame(width: 45, height: 72)
            Image(systemName: "photo.circle")
                .imageScale(.large)
                .font(.system(size: 24))
                .foregroundColor(.white)
        }
    }
    
    var body: some View {
        AsyncImage(url: url) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 72)
                    .shadow(color: colorScheme == .dark ? .clear : .secondary, radius: 3, x: 0, y: 2)
            } else if phase.error == nil {
                ProgressView()
            } else {
                missingArtworkImage
            }
        }
    }
}

struct ReadingListCell_Previews: PreviewProvider {
//    static var book = Book(title: "My Book",
//                           year: 1999,
//                           author: Author(firstName: "Fred",
//                                          lastName: "Smith"))
    static var previews: some View {
        Group {
            ReadingListCell(book: ReadingListViewModel.testBookWithCover)
            ReadingListCell(book: ReadingListViewModel.testBookWithoutCover)
        }
        .previewLayout(.fixed(width: 400, height: 80))

        
        ReadingListView()
        ReadingListView()
            .preferredColorScheme(.dark)
        ReadingListView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
