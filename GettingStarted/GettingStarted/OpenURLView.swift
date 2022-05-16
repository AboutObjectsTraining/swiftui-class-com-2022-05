// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

struct OpenURLView: View {
    @Environment(\.openURL) private var openURL

    var body: some View {
        VStack {
            Text("View Apple's Website")
            Button(action: open, label: { Text("Go") })
        }
    }
    
    func open() {
        if let url = URL(string: "https://www.apple.com") {
            openURL(url)
        }
    }
}

struct OpenURL_Previews: PreviewProvider {
    static var previews: some View {
        OpenURLView()
    }
}
