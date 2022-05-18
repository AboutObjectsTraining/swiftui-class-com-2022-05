// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

func +(lhs: CGSize, rhs: CGSize) -> CGSize {
    CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
}

struct CoolViewCell: View {
    @EnvironmentObject var coolViewModel: CoolViewModel
    let cellModel: CellModel
    
    @State var isBouncing = false
    
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
            .rotationEffect(.degrees(isBouncing ? 90 : 0))
            .bounceEffect(isBouncing)
            .gesture(dragGesture)
//            .gesture(tapGesture)
            .onTapGesture(count: 2, perform: bounce)
            .onTapGesture(count: 1, perform: bringCellToFront)
        // TODO: Animation effect
    }
}

// MARK: - View modifiers
extension View {
    
    func bounceEffect(_ isBouncing: Bool) -> some View {
        modifier(BounceEffect(size: isBouncing ? 120 : 0))
    }
}

struct BounceEffect: GeometryEffect {
    var size: CGFloat
    
    var animatableData: CGSize.AnimatableData {
        get { CGSize.AnimatableData(size, size * 2) }
        set { size = newValue.first }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        let translation = CGAffineTransform(translationX: animatableData.first,
                                            y: animatableData.second)
        return ProjectionTransform(translation)
    }
}


// MARK: - Actions
extension CoolViewCell {
    
    private func bounce() {
        withAnimation(bounceAnimation) {
            isBouncing = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
            withAnimation(reverseBounceAnimation) {
                isBouncing = false
            }
        }
    }
    
    private func bringCellToFront() {
        coolViewModel.bringCellToFront(cellModel)
    }
}

// MARK: - Animation
extension CoolViewCell {
    private var bounceAnimation: Animation {
        Animation
            .easeInOut(duration: 1)
            .repeatCount(7, autoreverses: true)
    }
    
    private var reverseBounceAnimation: Animation {
        Animation.easeInOut(duration: 1)
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
