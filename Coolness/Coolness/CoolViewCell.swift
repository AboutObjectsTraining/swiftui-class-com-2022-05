// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

func +(lhs: CGSize, rhs: CGSize) -> CGSize {
    CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
}

struct CoolViewCell: View {
    @EnvironmentObject var coolViewModel: CoolViewModel
    let cellModel: CellModel
    
    @GestureState private var offsetAmount = CGSize.zero
    @State private var currentOffset = CGSize.zero
    @State private var isHighlighted = false
    
//    private var tapGesture: some Gesture {
//        TapGesture(count: 1)
//            .updating($offsetAmount) { _, _, _ in
//                isHighlighted = true
//                bringCellToFront()
//            }
//            .onEnded { _ in
//                isHighlighted = false
//            }
//    }
    
    private var dragGesture: some Gesture {
        DragGesture()
            .updating($offsetAmount) { value, state, _ in
                state = value.translation
            }
            .onChanged{ _ in
                isHighlighted = true
                bringCellToFront()
            }
            .onEnded { value in
                currentOffset = currentOffset +  value.translation
                isHighlighted = false
            }
    }
    
    var body: some View {
        let offset = cellModel.offset + currentOffset + offsetAmount
        let backgroundColor = cellModel.color
            .opacity(isHighlighted ? 0.5 : 1.0)
        
        Text(cellModel.text)
            .coolTextStyle(color: .white, background: backgroundColor)
            .offset(offset)
            .gesture(dragGesture)
//            .gesture(tapGesture)
            .onTapGesture(count: 1, perform: bringCellToFront)
            .onTapGesture(count: 2, perform: {})
        // TODO: Animation effect
    }
}

// MARK: - Actions
extension CoolViewCell {
    private func bringCellToFront() {
        coolViewModel.bringCellToFront(cellModel)
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

struct CoolViewCell_Previews: PreviewProvider {
    
    static var previews: some View {
        CoolView()
            .environmentObject(CoolViewModel.testModel)
    }
}
