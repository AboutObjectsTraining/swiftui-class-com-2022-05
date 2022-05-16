// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

@main
struct GettingStartedApp: App {
    var body: some Scene {
        WindowGroup {
            GettingStartedView()
        }
    }
}

struct GettingStartedView: View {
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink("Collections 1", destination: Collections_1())
                    NavigationLink("Collections 2", destination: Collections_2())
                    NavigationLink("Collections 3", destination: Collections_3())
                    NavigationLink("Collections 4", destination: Collections_4())
                    NavigationLink("Collections 5", destination: Collections_4_1())
                }
                Section {
                    NavigationLink("Sheets 1", destination: Sheets_1())
                    NavigationLink("Sheets 2", destination: Sheets_2())
                }
                Section {
                    NavigationLink("Navigation 1", destination: Navigation_1())
                }
                Section {
                    NavigationLink("ConditionalView", destination: ConditionalView())
                    NavigationLink("Shapes", destination: Shapes())
                    NavigationLink("Stacks", destination: FancyWeatherView())
                    NavigationLink("Geometry", destination: Geometry())
                }
                Section {
                    NavigationLink("State", destination: HelloView())
                    NavigationLink("Bindings", destination: BindingsView())
                    NavigationLink("Gestures", destination: TapGestureView())
                    NavigationLink("Implicit Animation", destination: AnimateAllTheThings())
                    NavigationLink("Explicit Animation", destination: AnimatedCrossDisolve())
                }
                Section {
                    NavigationLink("State Object 1", destination: PersonView())
                    NavigationLink("State Object 2", destination: PeopleView())
                    NavigationLink("ObservedObject", destination: ObservedObjectView())
                    NavigationLink("Environment", destination: EnvironmentContentView())
                    NavigationLink("EnvironmentObject", destination: EnvironmentObjectView())
                    NavigationLink("Editing Text", destination: EditingTextView())
                }
                Section {
                    NavigationLink("Numbered List", destination: NumberedList())
                    NavigationLink("Numbered Grid", destination: NumberedGrid())
                    NavigationLink("Open URL", destination: OpenURLView())
                }
            }
        }
    }
}

struct GettingStarted_Preview: PreviewProvider {
    static var previews: some View {
        GettingStartedView()
    }
}
