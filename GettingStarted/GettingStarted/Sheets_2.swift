// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

struct Sheets_2: View {
    @StateObject private var viewModel = PersonViewModel_3()
    @State private var isEditing = false
    
    var body: some View {
        Form {
            VStack {
                HStack {
                    Label(viewModel.person.name, systemImage: "person.fill")
                    Spacer()
                    Text("Age: \(viewModel.person.age)")
                }
            }
        }
        .sheet(isPresented: $isEditing, onDismiss: update) {
            PersonForm(viewModel: viewModel, isEditing: $isEditing)
        }
        
        Button(action: show, label: { Text("Show Sheet") })
            .buttonStyle(.borderedProminent)
    }
    
    func show() {
        isEditing = true
    }
    
    func update() {
        print("Updated person")
    }
}

struct PersonForm: View {
    @ObservedObject var viewModel: PersonViewModel_3
    @Binding var isEditing: Bool
    
    var body: some View {
        Form {
            TextField("Name", text: $viewModel.person.name)
            TextField("Age", value: $viewModel.person.age, format: .number)
        }
        Button(action: done, label: { Text("Done") })
    }
    
    func done() {
        isEditing = false
    }
}

struct Sheets_2_Previews: PreviewProvider {
    static var previews: some View {
        Sheets_2()
    }
}
