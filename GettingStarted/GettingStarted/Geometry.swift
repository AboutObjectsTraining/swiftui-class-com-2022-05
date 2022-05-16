// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

struct Geometry: View {
    var body: some View {
        HStack {
            GeometryReader { geometry in
                let width = geometry.size.width / 2
                let height = geometry.size.height / 2
                Color.blue
                    .frame(width: width, height: height)
                    .position(x: width, y: height)
            }
        }
        .frame(width: 180, height: 80, alignment: .center)
        .background(.yellow)
    }
}

struct Geometry_Previews: PreviewProvider {
    static var previews: some View {
        Geometry()
    }
}
