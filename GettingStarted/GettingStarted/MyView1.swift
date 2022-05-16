// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

struct MyView1: View {
    var body: some View {
        Text("Hello World!")
            .foregroundColor(.green)
            .fontWeight(.heavy)
        // .fontWeight(_:) works here because foregroundColor(_:)
        // returns Text, whereas the next modifier, .padding(),
        // returns View.
            .padding()
        //  .fontWeight(.heavy) // Compile error if uncommented.
            .border(.purple)
    }
}

struct MyView1_1: View {
    var body: some View {
        VStack {
            Text("Multicolor SF Symbols")
                .fontWeight(.medium)
                .offset(y: -4)
            HStack {
                Image(systemName: "cloud.sun.rain.fill")
                Image(systemName: "circle.hexagongrid.fill")
                Image(systemName: "macwindow")
            }
            .symbolRenderingMode(.multicolor)
            .imageScale(.large)
            .font(.system(size: 28))
            .padding(6)
            .background(.orange.opacity(0.1))
            .cornerRadius(10)
        }
    }
}

struct MyView1_2: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(.orange)
            RoundedRectangle(cornerRadius: 15)
                .fill(Color(white: 1, opacity: 0.9))
            RoundedRectangle(cornerRadius: 15)
                .stroke(.orange, lineWidth: 5)
            Image(systemName: "star.circle")
                .font(.system(size: 60, weight: .light))
                .foregroundColor(.indigo.opacity(0.5))
        }
        .frame(height: 80)
    }
}

struct MyView1_Previews: PreviewProvider {
    static var previews: some View {
        MyView1()
            .previewLayout(.sizeThatFits)
            .padding(100)
        MyView1_1()
            .previewLayout(.sizeThatFits)
            .padding(100)
        MyView1_2()
            .previewLayout(.sizeThatFits)
            .padding(100)
    }
}
