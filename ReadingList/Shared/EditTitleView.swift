// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

let useRealTextField = true

struct EditTitleView: View {
    @ObservedObject var viewModel: ReadingListViewModel
    @State private var text = "Hello"
    
    var body: some View {
        NavigationView {
            Form {
                Section("Reading List") {
                    if useRealTextField {
                        RealTextField("Reading list title...", text: $text)
                            .clearButton(mode: .whileEditing)
                    } else {
                        TextFieldWithClearButton(text: $text)
                    }
                }
            }
            .navigationTitle("Edit Title")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: cancel, label: { Text("Cancel") })
                }
                ToolbarItem {
                    Button(action: done, label: { Text("Done") })
                }
            }
            .onAppear() {
                text = viewModel.readingList.title
            }
        }
    }
}

// MARK: - Actions
extension EditTitleView {
    
    private func done() {
        viewModel.finishedEditingTitle(text)
    }
    
    private func cancel() {
        viewModel.cancelEditingTitle()
    }
}

struct EditTitleView_Previews: PreviewProvider {
    static var viewModel = ReadingListViewModel()
    static var previews: some View {
        Group {
            EditTitleView(viewModel: viewModel)
            EditTitleView(viewModel: viewModel)
                .preferredColorScheme(.dark)
        }
        .previewLayout(.fixed(width: 400, height: 100))

        EditTitleView(viewModel: viewModel)
            .previewLayout(.fixed(width: 400, height: 140))
            .environment(\.sizeCategory, .accessibilityExtraLarge)
        
        EditTitleView(viewModel: viewModel)
        
//        ReadingListView()
    }
}
