import SwiftUI

public struct ImageButton: View {
    var imageName: String
    var text: String
    var backgroundColor: Color
    var action: () -> Void

    public init(imageName: String, text: String, backgroundColor: Color, action: @escaping () -> Void) {
        self.imageName = imageName
        self.text = text
        self.backgroundColor = backgroundColor
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .frame(width: 20, height: 20)
                Text(text)
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(backgroundColor)
            .cornerRadius(40)
        }
    }
}
