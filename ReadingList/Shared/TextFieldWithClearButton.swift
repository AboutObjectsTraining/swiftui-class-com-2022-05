// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

struct TextFieldWithClearButton: View {
    @Binding var text: String
    @FocusState private var isFocused: Bool
    
    var body: some View {
        HStack {
            TextField("Reading list title...", text: $text)
                .focused($isFocused)
            
            if isFocused, !text.isEmpty {
                Button(action: clear, label: { Image(systemName: "xmark.circle.fill") })
                    .padding(.trailing, 4)
                    .foregroundColor(.secondary)
            }
        }
    }
    
    // Actions
    private func clear() {
        text = ""
    }
}

struct TextFieldWithClearButton_Previews: PreviewProvider {
    static var previews: some View {
        Form {
            TextFieldWithClearButton(text: .constant("Hello"))
        }
    }
}
