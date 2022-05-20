// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

// Wrapper for the text field's delegate.
extension RealTextField {
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: RealTextField
        
        init(parent: RealTextField) {
            self.parent = parent
        }
        
        // MARK: UITextFieldDelegate protocol methods
        
        func textField(_ textField: UITextField,
                       shouldChangeCharactersIn range: NSRange,
                       replacementString string: String) -> Bool {
            guard let text = textField.text as? NSString else { return true }
            parent.text = text.replacingCharacters(in: range, with: string)
            parent.range = range
            return true
        }
    }
}

struct RealTextField: UIViewRepresentable {
    let placeholder: String
    var range = NSRange(location: 0, length: 0)
    @Binding var text: String
    
    // Stores the wrapped text field
    private let textField = UITextField()
    
    init(_ placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        _text = text
    }
    
    // Return a configured text field
    func makeUIView(context: Context) -> UITextField {
        textField.placeholder = "Hello"
        
        // Don't forget to set the delegate!
        textField.delegate = context.coordinator
        
        return textField
    }
    
    // Set properties of the text field to sync with state of this View
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
//        uiView.selectedTextRange = textField.textRange(from: range.location,
//                                                       to: range.location)
//        uiView.range = range
//        uiView.placeholder = "Hello"
    }
    
    // Return an instance of a type that wraps the delegate.
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
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
