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

func +(lhs: CGSize, rhs: CGSize) -> CGSize {
    CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
}

struct CoolViewCell: View {
    let cellModel: CellModel
    
    @GestureState private var offsetAmount = CGSize.zero
    @State private var currentOffset = CGSize.zero
    
    private var dragGesture: some Gesture {
        DragGesture()
            .updating($offsetAmount) { value, state, _ in
                state = value.translation
            }
            .onEnded { value in
                currentOffset = currentOffset +  value.translation
            }
    }
    
    var body: some View {
        let offset = cellModel.offset + currentOffset + offsetAmount
        
        Text(cellModel.text)
            .coolTextStyle(color: .white, background: cellModel.color)
            .offset(offset)
            .gesture(dragGesture)
    }
}

// MARK: - Custom view modifiers
extension Text {
    
    func coolTextStyle(color: Color, background: Color) -> some View {
        return self
            .font(.headline)
            .foregroundColor(color)
            .padding(.vertical, 9)
            .padding(.horizontal, 14)
            .background(background)
            .cornerRadius(10)
            .shadow(color: .primary.opacity(0.2), radius: 10, x: 0, y: 5)
            .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(color, lineWidth: 3))
    }
}


struct CoolViewCellContainer_Previews: PreviewProvider {
    
    static var previews: some View {
        CoolView()
            .environmentObject(CoolViewModel.testModel)
    }
}
