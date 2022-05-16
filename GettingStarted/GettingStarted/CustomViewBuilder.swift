// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

struct CustomViewBuilder: View {
    @State private var isShowing = false
    
    var body: some View {
        ZStack {
            VStack {
                if isShowing {
                    NotificationView(isShowing: $isShowing) {
                        VStack {
                            Spacer()
                                .frame(maxHeight: 40)
                            Image(systemName: "exclamationmark.triangle.fill")
                                .foregroundColor(.yellow)
                                .font(.system(size: 40))
                            Text("Something unexpected just happened!")
                                .foregroundColor(.white)
                                .padding(.vertical, 8)
                        }
                    }
                }
                Spacer()
            }
            Spacer()
            Button(isShowing ? "Hide Notification" : "Show Notification") {
                isShowing.toggle()
            }
            Spacer()
        }
        .edgesIgnoringSafeArea(.top)
        .transition(.move(edge: .top))
        .animation(.easeInOut(duration: 0.5), value: isShowing)
    }
}


struct NotificationView<Content: View>: View {
    @Binding var isShowing: Bool
    
    let content: Content
    
    init(isShowing: Binding<Bool>, @ViewBuilder content: () -> Content) {
        self.content = content()
        _isShowing = isShowing
    }
    
    var body: some View {
        content
            .padding()
            .background(Color(.orange))
            .cornerRadius(16)
            .transition(.move(edge: .top))
            .animation(.easeInOut(duration: 1), value: isShowing)
    }
}

struct CustomViewBuilder_Previews: PreviewProvider {
    static var previews: some View {
        CustomViewBuilder()
    }
}
