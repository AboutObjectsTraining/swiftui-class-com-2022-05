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
    @EnvironmentObject var readingListViewModel: ReadingListViewModel
    
//    @State var isEditing = false
    @Environment(\.editMode) var editMode
    private var isEditing: Bool {
        editMode?.wrappedValue.isEditing ?? false
    }
    
    @FocusState var focusedField: ActiveField?
    
    @State var book: Book

//    @State var title = ""
//    @State var year = ""
//    @State var first = ""
//    @State var last = ""
    
    
    var body: some View {
        Form {
            Section("Book") {
                TextFieldWithClearButton("The Tempest", text: $book.title)
                    .disabled(!isEditing)
                    .focused($focusedField, equals: .title)
                TextFieldWithClearButton("1999", text: $book.formattedYear)
                    .disabled(!isEditing)
                    .focused($focusedField, equals: .year)
            }
            Section("Author") {
                TextFieldWithClearButton("William", text: $book.author.firstName)
                    .disabled(!isEditing)
                    .focused($focusedField, equals: .first)
                TextFieldWithClearButton("Shakespeare", text: $book.author.lastName)
                    .disabled(!isEditing)
                    .focused($focusedField, equals: .last)
            }
        }
        .toolbar {
//            ToolbarItem(placement: .navigationBarLeading) {
//                Button(action: cancel,
//                       label: { Text("Cancel") })
//            }
            EditButton()
                .onChange(of: isEditing) { newValue in
                    focusedField = .title
                    update()
                }
        }
        .navigationBarBackButtonHidden(isEditing)
        
        //        .onAppear() {
        //            title = book.title
        //            year  = book.year.description
        //            first = book.author.firstName
        //            last  = book.author.lastName
        //        }
    }
    
    private func update() {
        readingListViewModel.updateBook(book)
    }
    
    private func cancel() {
        
    }
//    private func edit() {
//        isEditing.toggle()
//
////        if isEditing {
////            readingListViewModel.updateBook(book)
////        }
//    }
}

extension Book {

    var formattedYear: String {
        get { year.description }
        set { year = Int(newValue) ?? 0 }
    }
}


#if DEBUG
struct BookDetail_Previews: PreviewProvider {
    static var previews: some View {
        BookDetail(book: ReadingListViewModel.testBookWithCover)
            .environmentObject(ReadingListViewModel.preloaded)
        
        ReadingListView(viewModel: .preloaded)
    }
}
#endif
