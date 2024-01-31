import Foundation

public struct Memo: Identifiable {

    public var id: UUID = .init()
    public var word: String
    public var meaning: String

    public init(
        id: UUID = .init(),
        word: String,
        meaning: String
    ) {
        self.id = id
        self.word = word
        self.meaning = meaning
    }

}
