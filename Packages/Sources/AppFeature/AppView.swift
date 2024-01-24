import LifetimeTracker
import SharedViews
import SwiftUI

public struct AppView: View {

    @ObserveInjection private var iO

    public init() {
        #if DEBUG
        LifetimeTracker.setup(
            onUpdate: LifetimeTrackerDashboardIntegration(
                visibility: .visibleWithIssuesDetected,
                style: .circular
            ).refreshUI
        )
        #endif
    }

    public var body: some View {

        Text("Hello, World!")
            .enableInjection()
    }
}
