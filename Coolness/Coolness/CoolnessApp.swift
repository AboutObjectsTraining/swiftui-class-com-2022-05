// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

@main
struct CoolnessApp: App {
    @StateObject var viewModel = CoolViewModel(cellsModels: testData)
    
    var body: some Scene {
        WindowGroup {
            CoolView()
                .environmentObject(viewModel)
        }
    }
}
