import Foundation
import LifetimeTracker
import SwiftUI

public class LeakableModel: ObservableObject, LifetimeTrackable {

    public class var lifetimeConfiguration: LifetimeConfiguration {
        LifetimeConfiguration(maxCount: 1)
    }

    public init() {
        trackLifetime()
    }

}

public class ImageMemoryLeak: LeakableModel {}
public class VideoMemoryLeak: LeakableModel {}
public class AudioMemoryLeak: LeakableModel {
    public override class var lifetimeConfiguration: LifetimeConfiguration {
        LifetimeConfiguration(maxCount: 3)
    }
}
