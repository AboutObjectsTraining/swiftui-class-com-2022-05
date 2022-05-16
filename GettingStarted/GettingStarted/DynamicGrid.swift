// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

struct DynamicGrid: View {
    let colors: [Color] = [.red, .orange, .yellow, .green,
                           .blue, .indigo, .purple]
    
    var body: some View {
        let spacing: CGFloat = 6
        let columns = [
            GridItem(.fixed(50.00),
                     spacing: spacing),
            GridItem(.adaptive(minimum: 30.00, maximum: 100.00),
                     spacing: spacing),
            GridItem(.fixed(70.00),
                     spacing: spacing)
        ]
        
        ScrollView() {
            LazyVGrid(columns: columns) {
                ForEach(0..<301) { index in
                    Rectangle()
                        .fill(
                            colors[(index / 7) % 7]
                        )
                        .overlay(
                            Text("\(index)")
                        )
                        .frame(height: 40)
                }
            }
            .font(.caption)
            .foregroundColor(.white)
            .padding()
            .frame(width: 340.00)
        }
        .border(.secondary, width: 8)
        .background(.brown)
        .cornerRadius(15)
        .clipped()
    }
}

struct MyView5_Previews: PreviewProvider {
    static var previews: some View {
        DynamicGrid()
    }
}
