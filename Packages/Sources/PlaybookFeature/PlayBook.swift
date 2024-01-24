import Foundation
import HomeFeature
import Inject
@_exported import Playbook
@_exported import PlaybookUI
import SharedModels

public enum AppScenarios {

    public static func build() -> Playbook {
        let appPlaybook = Playbook()
        appPlaybook.addScenarios(of: "Home") {
            Scenario("Revealed", layout: .fill) {
                HomeView(model: .init(memoProvider: .init(loadMemos: {
                    let memo = Memo(word: "One", meaning: "Jeden")
                    return ([memo], [])
                }), animationSettings: .init()))
            }

            Scenario("Hidden", layout: .fill) {
                HomeView(model: .init(memoProvider: .init(loadMemos: {
                    let memo = Memo(word: "One", meaning: "Jeden")
                    return ([memo], [memo.id])
                }), animationSettings: .init()))
            }

            Scenario("1 Hidden, 3 revealed memos", layout: .fill) {
                HomeView(model: .init(memoProvider: .init(loadMemos: {
                    let memoOne = Memo(word: "One", meaning: "Jeden")
                    let memoTwo = Memo(word: "Two", meaning: "Dwa")
                    let memoThree = Memo(word: "Three", meaning: "Trzy")
                    return ([memoOne, memoTwo, memoThree], [memoOne.id])
                }), animationSettings: .init()))
            }
        }

        return appPlaybook
    }

}
