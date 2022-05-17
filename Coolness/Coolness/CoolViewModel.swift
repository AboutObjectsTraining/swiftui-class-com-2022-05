// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI
import Combine

final class CoolViewModel: ObservableObject {
    @Published private(set) var cellModels: [CellModel]
    
    init(cellsModels: [CellModel] = []) {
        self.cellModels = cellsModels
    }
}

// MARK: - Intents
extension CoolViewModel {
    
    // TODO: Add some intents
    
}



#if DEBUG

extension CoolViewModel {
    class var testModel: CoolViewModel {
        CoolViewModel(cellsModels: testData)
    }
}

let testData = [
    CellModel(text: "Hello World! 🌎🌏🌍", color: .purple, offset: CGSize(width: 20, height: 40)),
    CellModel(text: "Cool View Cells FTW! 🎉🍾", color: .orange, offset: CGSize(width: 50, height: 110)),
]

#endif
