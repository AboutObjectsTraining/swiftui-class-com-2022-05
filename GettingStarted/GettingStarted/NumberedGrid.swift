// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

struct NumberedGrid: View {
    let values = ["First Item", "Second Item", "Third Item", "Fourth Item", "Fifth Item", "Sixth Item"]
    
    var body: some View {
        let gridItems = [
            GridItem(.fixed(136)),
            GridItem(.fixed(136)),
        ]
        
        ScrollView {
            Spacer()
            LazyVGrid(columns: gridItems, spacing: 6) {
                ForEach(0..<values.count, id: \.self) { index in
                    ZStack {
                        Rectangle()
                            .cornerRadius(10)
                            .foregroundColor(.brown)
                        
                        Text("\(values[index])")
                            .frame(width: 90, alignment: .leading)
                            .font(.subheadline)
                            .padding(.leading, 36)
                            .padding(.trailing, 12)
                            .padding([.top, .bottom], 18)
                        
                        Image(systemName: "\(index + 1).circle")
                            .position(x: 15, y: 15)
                    }
                    .foregroundColor(.white)
                }
            }
        }
    }
}


struct NumberedListView_Previews: PreviewProvider {
    static var previews: some View {
        NumberedGrid()
    }
}
