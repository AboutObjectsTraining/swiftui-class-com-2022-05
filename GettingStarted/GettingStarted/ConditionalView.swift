// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

struct ConditionalView: View {
    @State var isSunny = false
    
    var body: some View {
        VStack {
            Spacer()
            
            if isSunny {
                Text("The weather is sunny.")
                    .padding()
                    .frame(width: 140, height: 140)
                    .border(.yellow, width: 6)
            } else {
                Image(systemName: "cloud.sun.rain.fill")
                    .font(.system(size: 60))
                    .padding(20)
                    .background(.gray)
            }
            
            Button(action: toggleWeather,
                   label: { Text("Toggle") })
            Spacer()
        }
        .symbolRenderingMode(.multicolor)
        .font(.system(size: 24))
    }
    
    func toggleWeather() {
        isSunny.toggle()
    }
}

struct ConditionalView_Previews: PreviewProvider {
    static var previews: some View {
        ConditionalView()
    }
}
