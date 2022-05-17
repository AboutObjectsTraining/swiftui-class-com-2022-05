import SwiftUI

struct MyView: View {
    var body: some View {
        HStack(spacing: 10) {
            Circle()
                .frame(width: 50)
            Text("My Awesome View ")
                .font(.title)
                .padding()
                .border(.green)
//                .fixedSize()
                .layoutPriority(1)
            Text("My Cool View!")
                .font(.title)
                .padding()
                .foregroundColor(.brown)
                .layoutPriority(2)
        }
    }
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView()
        Group {
            MyView()
            MyView()
                .preferredColorScheme(.dark)
        }
        .previewLayout(.sizeThatFits)
        
        Collections_5()
    }
}
