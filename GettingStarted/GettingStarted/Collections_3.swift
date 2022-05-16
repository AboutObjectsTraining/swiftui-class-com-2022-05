// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

struct Collections_3_1: View {
    var body: some View {
        List {
            Text("Item One")
            Text("Item Two")
            Text("Item Three")
        }
    }
}

struct Collections_3: View {
    let strings = ["First Item", "Second Item", "Third Item"]
    
    var body: some View {
        List {
            ForEach(strings, id: \.self) { string in
                Text(string)
            }
        }
    }
}

struct Collections_3_Previews: PreviewProvider {
    static var previews: some View {
        Collections_3()
        Collections_3_1()
    }
}
