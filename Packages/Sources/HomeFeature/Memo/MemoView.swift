import SharedModels
import SharedViews
import SwiftUI

struct MemoView: View {
    @ObserveInjection var iO
    @Bindable var model: MemoModel
    var animationSettings: BetaSettings.Animations

    var body: some View {
        ZStack {
            frontCard
                .padding(5)
                .frame(maxWidth: .infinity)
                .frame(maxHeight: 300)
                .background(RoundedRectangle(cornerRadius: 12, style: .continuous).fill(Color.blue))
                .modifier(FlipOpacity(pct: model.isRevealed ? 0 : 1))
                .rotation3DEffect(Angle.degrees(model.isRevealed ? 180 : 360), axis: (0, 1, 0))

            backCard
                .padding(5)
                .frame(maxWidth: .infinity)
                .frame(maxHeight: 300)
                .background(RoundedRectangle(cornerRadius: 12, style: .continuous).fill(Color.green))
                .modifier(FlipOpacity(pct: model.isRevealed ? 1 : 0))
                .rotation3DEffect(Angle.degrees(model.isRevealed ? 0 : 180), axis: (0, 1, 0))
        }
        .enableInjection()
    }

    @ViewBuilder
    private var backCard: some View {
        VStack {
            Text(model.memo.meaning)
                .font(.headline)

            Button("Hide") {
                withAnimation(animationSettings.postOpeningAnimation) {
                    model.isRevealed = false
                }
            }
            .foregroundColor(.white)
            .bold()
            .buttonStyle(.bordered)
        }
    }

    @ViewBuilder
    private var frontCard: some View {
        VStack {
            Text(model.memo.word)
                .font(.headline)

            Button("Reveal") {
                withAnimation(animationSettings.postOpeningAnimation) {
                    model.isRevealed = true
                }
            }
            .foregroundColor(.white)
            .bold()
            .buttonStyle(.bordered)
        }
    }
}

struct FlipOpacity: AnimatableModifier {
    var pct: CGFloat = 0

    var animatableData: CGFloat {
        get { pct }
        set { pct = newValue }
    }

    func body(content: Content) -> some View {
        content.opacity(Double(pct.rounded()))
    }
}

extension BetaSettings.Animations {
    var postOpeningAnimation: Animation {
        Animation.linear(duration: postOpeningSpeed)
    }
}
