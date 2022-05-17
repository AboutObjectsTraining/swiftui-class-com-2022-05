// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

struct AnimateAllTheThings: View {
    @State private var isRotating = false
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Hello, World!")
                .fontWeight(.bold)
                .padding()
                .foregroundColor(.white)
            
            // Animatable modifiers
                .background(isRotating ? .pink : .purple)
                .opacity(isRotating ? 0.5 : 1.0)
            
            // Animatable geometry effects
                .transformEffect(CGAffineTransform(translationX: 0, y: isRotating ? 100 : 0))
                .scaleEffect(isRotating ? CGSize(width: 1.5, height: 1.5) : CGSize(width: 1, height: 1))
                .rotationEffect(Angle(degrees: isRotating ? 1200 : 0))
            
            // Implicit animation configuration
                .animation(.easeInOut(duration: 1), value: isRotating)
            
            Spacer()
            
            Button(action: rotate, label: { Text("Rotate") })
                .buttonStyle(.bordered)
            
            Spacer()
        }
    }
    
    private func rotate() {
        isRotating.toggle()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            isRotating.toggle()
        }
    }
}

struct AnimatedCrossDisolve: View {
    @State private var isDefault = true
    
    var body: some View {
        ZStack {
            if (isDefault) {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 100, height: 100)
            } else {
                Rectangle()
                    .fill(Color.green)
                    .frame(width: 100, height: 100)
            }
        }
        .onTapGesture { crossDissolve() }
    }
    
    func crossDissolve() {
        withAnimation(.easeInOut(duration: 1)) {
            isDefault.toggle()
        }
    }
}

struct Animation_Previews: PreviewProvider {
    static var previews: some View {
        AnimateAllTheThings()
        AnimatedCrossDisolve()
    }
}
