// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI
import ReadingListModel

struct ReadingListCell: View {
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
        HStack {
            overview
                .layoutPriority(1)
            
            NavigationLink("") {
                // TODO: Implement detail view
                Text(book.title)
                    .navigationTitle("Book Detail")
            }
        }
    }
}

struct ReadingListCell_Previews: PreviewProvider {
    static var book = Book(title: "My Book",
                           year: 1999,
                           author: Author(firstName: "Fred",
                                          lastName: "Smith"))
    static var previews: some View {
        ReadingListCell(book: book)
            .previewLayout(.sizeThatFits)
        
        ReadingListView()
    }
}
