// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

struct EnvironmentContentView: View {
    // Reads the current color scheme inherited from
    // parent view
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        VStack(spacing: 4) {
            Text("Hello, World!")
            Text("Have a Nice " +
                 (colorScheme == .dark ? "Night!" : "Day!"))
            Image(systemName: colorScheme == .dark
                  ? "moon.circle.fill"
                  : "sun.max.fill")
        }
        // Explicitly sets values in VStack's environment.
        // Note that there are existing modifiers for each of these.
        .environment(\.font, Font.system(size: 30))
        .environment(\.symbolRenderingMode, .multicolor)
    }
}

struct Environment_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentContentView()
        EnvironmentContentView()
        // Sets the color scheme in the environment
            .preferredColorScheme(.dark)
    }
}
