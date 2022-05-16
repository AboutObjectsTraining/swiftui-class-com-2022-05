// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

struct Sheets_1: View {
    @State private var isShowingSheet = false
    
    var body: some View {
        VStack {
            TitledButton(title: "Main View", action: showSheet, label: "Show Sheet")
        }
        .sheet(isPresented: $isShowingSheet) {
            TitledButton(title: "Sheet", action: dismiss, label: "Dismiss")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.orange.opacity(0.1))
    }
    
    func showSheet() {
        isShowingSheet = true
    }
    
    func dismiss() {
        isShowingSheet = false
    }
}

struct TitledButton: View {
    let title: String
    let action: () -> Void
    let label: String
    
    var body: some View {
        Text(title)
            .padding()
            .font(.system(size: 25, weight: .medium))
        Button(action: action, label: { Text(label) })
    }
}


struct Sheets_1_Previews: PreviewProvider {
    static var previews: some View {
        Sheets_1()
    }
}
