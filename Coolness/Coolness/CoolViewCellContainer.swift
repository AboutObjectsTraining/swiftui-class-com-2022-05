// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

struct CoolViewCellContainer: View {
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.regularMaterial)
                .edgesIgnoringSafeArea(.bottom)
            CoolViewCells()
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct CoolViewCells: View {
    @EnvironmentObject var coolViewModel: CoolViewModel
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            ForEach(coolViewModel.cellModels) { cellModel in
                CoolViewCell(cellModel: cellModel)
            }
            .frame(width: width, height: height, alignment: .topLeading)
        }
    }
}


struct CoolViewCellContainer_Previews: PreviewProvider {
    
    static var previews: some View {
        CoolView()
            .environmentObject(CoolViewModel.testModel)
    }
}
