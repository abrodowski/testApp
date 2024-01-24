import Foundation
import SharedModels

@Observable
public class SettingsModel {
    enum Subscreen: String, Identifiable, CaseIterable {
        case settings
        #if DEBUG
        case betaSettings
        #endif
        var id: String { rawValue }

        var displayString: String {
            switch self {
            case .settings:
                "Settings"
            #if DEBUG
            case .betaSettings:
                "Beta Settings"
            #endif
            }
        }
    }

    var subscreen: Subscreen?
    public var betaSettings: BetaSettings = .init()

    public init() {}
}
