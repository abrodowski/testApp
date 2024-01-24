import Foundation
import Observation
import SharedModels

public struct MemoProvider {
    public init(loadMemos: @escaping () async -> (memos: [Memo], revealedIDs: Set<Memo.ID>)) {
        self.loadMemos = loadMemos
    }

    public var loadMemos: () async -> (memos: [Memo], revealedIDs: Set<Memo.ID>)
}

@Observable
public class HomeModel {
    let memoProvider: MemoProvider

    var memos: [MemoModel] = []
    public var animationSettings: BetaSettings.Animations
    public var gridSettings: BetaSettings.Grids

    public init(memoProvider: MemoProvider = MemoProvider(loadMemos: { ([Memo(word: "a", meaning: "b"),
                                                                         Memo(word: "c", meaning: "d"),
                                                                         Memo(word: "e", meaning: "f"),
                                                                         Memo(word: "g", meaning: "h"), ], []) }),
                animationSettings: BetaSettings.Animations = .init(),
                gridSettings: BetaSettings.Grids = .init()) {
        self.memoProvider = memoProvider
        self.animationSettings = animationSettings
        self.gridSettings = gridSettings
    }

    func onAppear() async {
        let memos = await memoProvider.loadMemos()
        self.memos = memos.memos.map {
            MemoModel(memo: $0, isRevealed: memos.revealedIDs.contains($0.id))
        }
    }
}
