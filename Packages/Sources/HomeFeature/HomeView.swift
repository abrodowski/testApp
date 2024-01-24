import SharedViews
import SwiftUI

public struct HomeView: View {
    @ObserveInjection private var iO
    var model: HomeModel

    public init(model: HomeModel) {
        self.model = model
    }

    var columns: [GridItem] {
        Array(repeating: .init(.flexible()), count: model.gridSettings.gridSize)
        }
    public var body: some View {
        VStack {
            Text("Memo test app")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()

            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(model.memos) { memo in
                        MemoView(model: memo, animationSettings: model.animationSettings)
                            .aspectRatio(1, contentMode: .fit)
                    }
                }
                .padding()
            }
        }
        .task {
            await model.onAppear()
        }
        .enableInjection()
    }
}
