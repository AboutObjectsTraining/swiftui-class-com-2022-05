// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI
import GitHubModel

struct QueryView: View {
    @ObservedObject var viewModel: RepositoriesViewModel
    @State private var textDidChange = false
    
    var body: some View {
        VStack {
            buttonBar
            
            VStack {
                Text("Search For Matching GitHub Repos")
                    .font(.callout)
                    .foregroundColor(.secondary)
                TextField("Enter search text", text: $viewModel.queryText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .modifier(ClearButton(text: $viewModel.queryText, textDidChange: $textDidChange))
            }
            .padding(.horizontal)
            
            Spacer()
        }
    }
    
    var buttonBar: some View {
        HStack(alignment: .bottom) {
            Button(action: cancel) {
                Image(systemName: "xmark")
                    .foregroundColor(.blue)
            }
            .font(.system(size: 18, weight: .light))
            .foregroundColor(.secondary)
            Spacer()
            Button("Search", action: performSearch)
                .font(.system(size: 18, weight: .semibold))
        }
        .padding(.horizontal)
        .padding(.vertical, 18)
    }
}

// MARK: - Intents
extension QueryView {
    
    private func performSearch() {
        viewModel.newSearch()
        viewModel.dismissQueryView()
    }
    
    private func cancel() {
        viewModel.dismissQueryView()
    }
}

struct ClearButton: ViewModifier {
    @Binding var text: String
    @Binding var textDidChange: Bool
    
    public func body(content: Content) -> some View {
        ZStack(alignment: .trailing) {
            content
            if !text.isEmpty {
                Button(action: { self.text = ""; textDidChange = true }) {
                    Image(systemName: "multiply.circle.fill")
                        .foregroundColor(Color(UIColor.opaqueSeparator))
                }
                .padding(.trailing, 8)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var viewModel: RepositoriesViewModel = {
        let viewModel = RepositoriesViewModel()
        viewModel.queryText = "SwiftUI"
        viewModel.isShowingQueryView = true
        return viewModel
    }()
    
    static var previews: some View {
        QueryView(viewModel: viewModel)
    }
}
