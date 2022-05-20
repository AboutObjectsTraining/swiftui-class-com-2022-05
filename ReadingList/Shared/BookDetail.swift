// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI
import ReadingListModel

enum ActiveField {
    case title
    case year
    case first
    case last
}

struct BookDetail: View {
    // TODO: Integrate view model.
    @Environment(\.editMode) var editMode
    private var isEditing: Bool {
        editMode?.wrappedValue.isEditing ?? false
    }
    
    @FocusState var focusedField: ActiveField?
    
    @State var book: Book
        
    var body: some View {
        Form {
            Section("Book") {
                TextFieldWithClearButton("The Tempest", text: $book.title, disabled: !isEditing)
                    .focused($focusedField, equals: .title)
                TextFieldWithClearButton("1999", text: $book.formattedYear, disabled: !isEditing)
                    .focused($focusedField, equals: .year)
            }
            Section("Author") {
                TextFieldWithClearButton("William", text: $book.author.firstName, disabled: !isEditing)
                    .focused($focusedField, equals: .first)
                TextFieldWithClearButton("Shakespeare", text: $book.author.lastName, disabled: !isEditing)
                    .focused($focusedField, equals: .last)
            }
        }
        .toolbar {
            EditButton()
                .onChange(of: isEditing) { newValue in
                    focusedField = .title
                }
        }
    }
}

#if DEBUG
struct BookDetail_Previews: PreviewProvider {
    static var previews: some View {
        BookDetail(book: ReadingListViewModel.testBookWithCover)
        
        ReadingListView(viewModel: .preloaded)
    }
}
#endif
