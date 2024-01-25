import SharedModels
import SharedViews
import SwiftUI

public struct SettingsView: View {
    @ObserveInjection private var iO

    @Bindable
    public var model: SettingsModel

    public init(model: SettingsModel) {
        self.model = model
    }

    public var body: some View {
        NavigationStack {
            List {
                ForEach(Array(SettingsModel.Subscreen.allCases)) { subscreen in
                    NavigationLink(subscreen.displayString, value: subscreen)
                }
            }
            .navigationDestination(for: SettingsModel.Subscreen.self) { subscreen in
                switch subscreen {
                #if DEBUG
                case .betaSettings:
                    BetaSettingsView()
                #endif
                case .settings:
                    EmptyView()
                }
            }
        }
        .enableInjection()
    }
}
