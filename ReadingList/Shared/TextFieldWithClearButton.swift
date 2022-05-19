// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

struct TextFieldWithClearButton: View {
    let placeholder: String
    let isDisabled: Bool
    @Binding var text: String
    @FocusState private var isFocused: Bool
    
    var body: some View {
        HStack {
            TextField(placeholder, text: $text)
                .focused($isFocused)
                .disabled(isDisabled)
            
            if isFocused, !text.isEmpty {
                Button(action: clear, label: { Image(systemName: "xmark.circle.fill") })
                    .padding(.trailing, 4)
                    .foregroundColor(.secondary)
            }
        }
    }
    
    init(_ placeholder: String = "", text: Binding<String>, disabled: Bool = false) {
        self.placeholder = placeholder
        _text = text
        isDisabled = disabled
    }
    
    // Actions
    private func clear() {
        text = ""
    }
}

struct TextFieldWithClearButton_Previews: PreviewProvider {
    static var previews: some View {
        Form {
            TextFieldWithClearButton(text: .constant("Hello"), disabled: false)
            TextFieldWithClearButton(text: .constant("Bye"), disabled: true)
        }
    }
}
