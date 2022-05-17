// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

struct CoolView: View {
    @State var text = ""
    
    private func clearButtonImage() -> some View {
        Image(systemName: "xmark.circle.fill")
            .padding(6)
            .imageScale(.large)
            .accentColor(.gray)
    }
    
    private var textField: some View {
        ZStack(alignment: .trailing) {
            TextField("Type here...", text: $text)
                .textFieldStyle(.roundedBorder)
            
            if !text.isEmpty {
                Button(action: {}, label: clearButtonImage)
            }
        }
    }
    
    var body: some View {
        ZStack {
            Color.orange
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                HStack {
                    textField
                    
                    Button(action: {}, label: { Text("Add") })
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 80)
                .background(.white.opacity(0.5))
                
                Rectangle()
                    .fill(.white.opacity(0.7))
                    .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
}

struct CoolView_Previews: PreviewProvider {
    static var previews: some View {
        CoolView()
        CoolView()
            .previewInterfaceOrientation(.landscapeLeft)
        CoolView()
            .preferredColorScheme(.dark)
    }
}