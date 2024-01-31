import Foundation

public struct BetaSettings: Codable {

    public struct Grids: Codable {
        public var gridSize: Int = 3
        public init() {}
    }

    public struct Animations: Codable {

        public var postOpeningSpeed: Double = 0.2

        public init() {}
    }

    public var animations: Animations = .init()
    public var grids: Grids = .init()

    public init() {}
}

public class BetaSettingsExternalData: ObservableObject {
    public init() {}
}
