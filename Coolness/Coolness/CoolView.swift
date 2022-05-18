// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

struct CoolView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var backgroundColor: Color {
        colorScheme == .dark ? Color.brown : Color.orange
    }
    
    var body: some View {
        ZStack {
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                AccessoryView()
                CoolViewCellContainer()
            }
        }
    }
}

#if DEBUG
struct CoolView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            CoolView()
            CoolView()
                .preferredColorScheme(.dark)
            CoolView()
                .previewInterfaceOrientation(.landscapeLeft)
        }
        .environmentObject(CoolViewModel.testModel)
    }
}
#endif
