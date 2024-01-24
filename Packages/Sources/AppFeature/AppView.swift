import HomeFeature
import LifetimeTracker
import MemoryLeakFeature
import SettingsFeature
import SharedModels
import SharedViews
import SwiftUI

public struct AppView: View {

    @ObserveInjection private var iO

    @State private var settingsModel = SettingsModel()
    @State private var homeModel = HomeModel()

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
        TabView {
            HomeView(model: homeModel)
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            SettingsView(model: settingsModel)
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }

            MemoryLeakView()
                .tabItem {
                    Label("Memory leak", systemImage: "memorychip")
                }
        }
        .enableInjection()
    }
}
