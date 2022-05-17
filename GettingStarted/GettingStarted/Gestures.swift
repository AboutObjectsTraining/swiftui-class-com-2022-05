// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

struct TapGestureView: View {
    @State private var isAlternateColor = false
    
    var body: some View {
        Circle()
            .fill(isAlternateColor ? .green : .blue)
            .frame(width: 80, height: 80)
            .onTapGesture {
                isAlternateColor.toggle()
            }
    }
}

struct RotationGestureView: View {
    @State private var angle = Angle(degrees: 0)
    
    private var rotationGesture: some Gesture {
        RotationGesture()
            .onChanged { angle = $0 }
    }
    
    var body: some View {
        Color.blue
            .frame(width: 160, height: 80)
            .rotationEffect(angle)
            .gesture(rotationGesture)
    }
}

struct Gestures_Previews: PreviewProvider {
    static var previews: some View {
        TapGestureView()
        RotationGestureView()
    }
}
