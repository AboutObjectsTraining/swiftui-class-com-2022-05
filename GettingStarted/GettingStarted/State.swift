// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

struct HelloView: View {
    @State private var isSayingHello = true
    
    var body: some View {
        HStack {
            Text(isSayingHello ? "Hello!" : "Goodbye.")
            Button(action: toggle,
                   label: { Text("Toggle") })
        }
    }
    
    private func toggle() {
        isSayingHello.toggle()
    }
}

struct State_Previews: PreviewProvider {
    static var previews: some View {
        HelloView()
    }
}
