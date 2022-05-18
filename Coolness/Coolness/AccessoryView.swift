// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

struct AccessoryView: View {
    @EnvironmentObject var viewModel: CoolViewModel
    
    private func clearButtonImage() -> some View {
        Image(systemName: "xmark.circle.fill")
            .padding(6)
            .imageScale(.large)
            .tint(.gray)
    }
    
    private var clearButton: some View {
        Group {
            if !viewModel.text.isEmpty {
                Button(action: clear, label: clearButtonImage)
            } else {
                EmptyView()
            }
        }
    }
    
    private var textField: some View {
        ZStack(alignment: .trailing) {
            TextField("Type here...", text: $viewModel.text)
                .textFieldStyle(.roundedBorder)
            clearButton
        }
    }
    
    private var addButton: some View {
        Button(action: addCell) {
            Image(systemName: "plus.circle.fill")
                .imageScale(.large)
                .font(.system(size: 22))
        }
    }
    
    var body: some View {
        HStack {
            textField
            addButton
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: 80)
        .background(.thickMaterial)
        .tint(.orange)
    }
}

// MARK: - Actions
extension AccessoryView {
    
    private func clear() {
        viewModel.clearTextField()
    }
    
    private func addCell() {
        viewModel.addCell()
    }
}

struct AccessoryView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AccessoryView()
                .previewLayout(.sizeThatFits)
                .background(.orange)
            CoolView()
        }
        .environmentObject(CoolViewModel.testModel)
    }
}
