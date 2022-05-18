// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI
import GitHubModel

@main
struct GitHubBrowserApp: App {
    var body: some Scene {
        WindowGroup {
            RepositoriesView(viewModel: RepositoriesViewModel())
        }
    }
}
