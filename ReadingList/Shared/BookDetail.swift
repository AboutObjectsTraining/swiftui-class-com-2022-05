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
    
    let book: Book
    
    @State var title = ""
    @State var year = ""
    @State var first = ""
    @State var last = ""
    
    
    var body: some View {
        Form {
            Section("Book") {
                TextFieldWithClearButton("The Tempest", text: $title, disabled: !isEditing)
                    .focused($focusedField, equals: .title)
                TextFieldWithClearButton("1999", text: $year, disabled: !isEditing)
                    .focused($focusedField, equals: .year)
            }
            Section("Author") {
                TextFieldWithClearButton("William", text: $first, disabled: !isEditing)
                    .focused($focusedField, equals: .first)
                TextFieldWithClearButton("Shakespeare", text: $last, disabled: !isEditing)
                    .focused($focusedField, equals: .last)
            }
        }
        .toolbar {
            EditButton()
                .onChange(of: isEditing) { newValue in
                    focusedField = .title
                }
        }
        .onAppear() {
            title = book.title
            year = book.year.description
            first = book.author.firstName
            last = book.author.lastName
        }
    }
}

#if DEBUG
struct BookDetail_Previews: PreviewProvider {
    static var previews: some View {
        BookDetail(book: ReadingListViewModel.testBookWithCover)
        ReadingListView(viewModel: ReadingListViewModel())
    }
}
#endif
