// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

struct Collections_1: View {
    let strings = ["First Item", "Second Item", "Third Item", "Fourth Item", "Fifth Item", "Sixth Item"]
    
    var body: some View {
        VStack {
            ForEach(strings, id: \.self) { string in
                Text(string)
            }
        }
    }
}

struct Collections_1_1: View {
    var body: some View {
        let colors: [Color] = [.red, .orange, .yellow, .green, .blue,
                               .indigo, .purple, .cyan, .teal, .brown]
        
        VStack {
            ForEach(colors, id: \.self) { color in
                ColorDescription(color: color)
            }
        }
    }
}

struct ColorDescription: View {
    let color: Color
    
    var body: some View {
        HStack {
            HStack {
                Text("\(color.description.capitalized)")
                    .font(.system(size: 26, weight: .light))
                Spacer()
            }
            .frame(width: 100)
            
            color
        }
        .padding()
    }
}


struct Collections_1_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Collections_1()
            Collections_1_1()
        }
    }
}
