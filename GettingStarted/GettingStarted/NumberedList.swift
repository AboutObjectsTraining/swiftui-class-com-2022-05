// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI


struct NumberedList: View {
    let values = ["First Item", "Second Item", "Third Item", "Fourth Item", "Fifth Item", "Sixth Item"]
    
    var body: some View {
        List(0..<6) { index in
            CellView(index: index, value: values[index])
        }
    }
}

struct CellView: View {
    let index: Int
    let value: String
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Image(systemName: "\(index + 1).circle")
            Text(value.description)
                .fontWeight(.light)
        }
        .font(.title3)
        .foregroundColor(.indigo)
        .padding(.vertical, 8)
    }
}

struct NumberedList_Previews: PreviewProvider {
    static var previews: some View {
        NumberedList()
    }
}
