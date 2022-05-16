// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

struct BindingsView: View {
    @State private var isVisible = false
    
    var body: some View {
        VStack {
            Toggle("Show Message", isOn: $isVisible)
            
            Text(isVisible ? "Hello, World!" : "")
        }
        .frame(width: 180)
    }
}

struct Bindings_Previews: PreviewProvider {
    static var previews: some View {
        BindingsView()
    }
}
