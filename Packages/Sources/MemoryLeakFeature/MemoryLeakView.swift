import SharedModels
import SharedViews
import SwiftUI

var leakStorage = [LeakableModel]()

public struct MemoryLeakView: View {

    @ObserveInjection private var iO

    public init() {}

    public var body: some View {
        VStack {
            Text("Memory leaks test")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()

            ScrollView {
                VStack(spacing: 20) {
                    ImageButton(imageName: "exclamationmark.triangle", text: "Leak def", backgroundColor: .blue) {
                        leakStorage.append(LeakableModel())
                    }

                    ImageButton(imageName: "photo", text: "Image leak", backgroundColor: .green) {
                        leakStorage.append(ImageMemoryLeak())
                    }

                    ImageButton(imageName: "waveform", text: "Audio leak", backgroundColor: .teal) {
                        leakStorage.append(AudioMemoryLeak())
                    }

                    ImageButton(imageName: "video", text: "Video leak", backgroundColor: .indigo) {
                        leakStorage.append(VideoMemoryLeak())
                    }
                }
                .padding()
            }

            .enableInjection()
        }
    }

}

#Preview {
    MemoryLeakView()
}
