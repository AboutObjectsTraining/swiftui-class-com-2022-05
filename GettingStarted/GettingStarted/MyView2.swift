import SwiftUI

struct MyView2: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            RowView(text1: "One", text2: "Two")
            RowView(text1: "Three", text2: "Four")
            RowView(text1: "Five", text2: "Six")
        }
        .border(Color.gray, width: 1)
    }
}

struct MyView_2_Preview: PreviewProvider {
    static var previews: some View {
        MyView2()
    }
}


struct MyView_2: View {
    var body: some View {
        Text("One")
        Text("Two")
    }
}

struct RowView: View {
    let text1: String
    let text2: String
    
    var body: some View {
        HStack(spacing: 0) {
            Group {
                Text(text1)
                Text(text2)
            }
            .frame(width: 100)
            .padding()
            .border(Color.gray, width: 0.5)
        }
        .font(.system(size: 20))
    }
}
