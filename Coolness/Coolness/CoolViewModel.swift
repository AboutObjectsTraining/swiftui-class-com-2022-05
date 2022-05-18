// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI
import Combine

final class CoolViewModel: ObservableObject {
    @Published private(set) var cellModels: [CellModel]
    @Published var text = ""
    
    init(cellsModels: [CellModel] = []) {
        self.cellModels = cellsModels
    }
}

// MARK: - Intents (Actions)
extension CoolViewModel {
    
    func clearTextField() {
        text = ""
    }
    
    func addCell() {
        let cellModel = CellModel(text: text, color: .blue, offset: .zero)
        cellModels.append(cellModel)
    }
    
    func bringCellToFront(_ cellModel: CellModel) {
        guard let index = cellModels.firstIndex(where: { $0 == cellModel }) else { return }
        cellModels.remove(at: index)
        cellModels.append(cellModel)
    }
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
