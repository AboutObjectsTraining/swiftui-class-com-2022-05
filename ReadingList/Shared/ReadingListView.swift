// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

struct ReadingListView: View {
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Rectangle()
                    .fill(.tertiary).opacity(0.5)
                Text("There currently aren't any books in this reading list.")
                    .navigationTitle("My Reading List")
                    .font(.title2.italic())
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding()
                    .padding(.top, 120)
            }
        }
    }
}

struct ReadingListView_Previews: PreviewProvider {
    static var previews: some View {
        ReadingListView()
        ReadingListView()
            .preferredColorScheme(.dark)
        ReadingListView()
            .environment(\.sizeCategory, .accessibilityExtraExtraLarge)

    }
}
