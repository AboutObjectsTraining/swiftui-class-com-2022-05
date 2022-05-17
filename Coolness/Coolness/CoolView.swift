// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

struct CoolView: View {
    @EnvironmentObject var viewModel: CoolViewModel
    
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
    
    private var accessoryView: some View {
        HStack {
            textField
            
            Button(action: {}, label: { Text("Add") })
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: 80)
        .background(.thickMaterial)
    }
    
    var body: some View {
        ZStack {
            Color.orange
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                accessoryView
                CoolViewCellContainer()
            }
        }
    }
}

#if DEBUG
//extension CoolView {
//
//    static var testView: CoolView {
//        CoolView()
//    }
//}

struct CoolView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            CoolView()
                .environmentObject(CoolViewModel.testModel)
//            CoolView.testView
//                .previewInterfaceOrientation(.landscapeLeft)
//            CoolView.testView
//                .preferredColorScheme(.dark)
        }
    }
}
#endif
