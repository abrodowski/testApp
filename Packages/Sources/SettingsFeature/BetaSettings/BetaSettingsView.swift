import Inject
import SharedModels
import SwiftUI

struct BetaSettingsView: View {

    @ObserveInjection
    private var iO

    var body: some View {
        Text("nothing yet")
            .navigationBarTitle("Beta Settings")
            .enableInjection()
    }
}
