// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

struct RealTextField: UIViewRepresentable {
    let placeholder: String
    @Binding var text: String
    
    private let textField = UITextField()
    
    init(_ placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        _text = text
    }
    
    func makeUIView(context: Context) -> UITextField {
        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
        uiView.placeholder = "Hello"
    }
}

// MARK: View modifiers
extension RealTextField {
    
    func autofocused() -> RealTextField {
        textField.becomeFirstResponder()
        return self
    }
    
    func clearButton(mode: UITextField.ViewMode) -> RealTextField {
        textField.clearButtonMode = mode
        return self
    }
}

#if DEBUG

struct RealTextField_Previews: PreviewProvider {
    static var previews: some View {
        Form {
            RealTextField("Type here...", text: .constant("Hello"))
                .clearButton(mode: .whileEditing)
                .autofocused()
            RealTextField("Type here...", text: .constant("Hello"))
                .clearButton(mode: .whileEditing)
        }
    }
}

#endif
