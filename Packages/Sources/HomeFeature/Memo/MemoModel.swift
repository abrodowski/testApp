import Foundation
import SharedModels

@Observable
class MemoModel: Identifiable {
    let memo: Memo
    var id: Memo.ID { memo.id }
    var isRevealed: Bool

    init(memo: Memo, isRevealed: Bool) {
        self.memo = memo
        self.isRevealed = isRevealed
    }
}
