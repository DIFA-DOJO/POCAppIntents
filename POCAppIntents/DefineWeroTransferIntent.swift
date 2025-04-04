import AppIntents
import SwiftUI
import Contacts

//struct PerformWeroTransferIntent: AppIntent {
//    let amount: Double
//    let currency: Currency
//    
//    static var openAppWhenRun: Bool = true
//    
//    func perform() async throws -> some IntentResult {
//        // 1. connect if needed
//        
//        // 2. perform the transfer
//        
//        return .result()
//    }
//}

struct WeroTransferIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Send money"

    static var description = IntentDescription("Send money to someone")
    
    static var openAppWhenRun: Bool = true
    
    @Parameter(title: "Amount")
    var amount: Double
    
    @Parameter(title: "Currency", default: .euro)
    var currency: Currency
    
    @Parameter(title: "Beneficiary", optionsProvider: BeneficiariesOptionsProvider())
    var beneficiary: CNContact
    
    @MainActor
    func perform() async throws -> some IntentResult & OpensIntent {
        // Because `openAppWhenRun == true` the app is up and running…
        // We just need to reroute user to the populated screen.
        
        return .result(opensIntent: OpenURLIntent(URL(string: "wero://facebook.com")!))
    }
    
    private struct BeneficiariesOptionsProvider: DynamicOptionsProvider {
        func results() async throws -> [CNContact] {
            []
        }
    }
}

enum Currency: String, AppEnum {
    
    static var typeDisplayRepresentation = TypeDisplayRepresentation(
        name: "Currency",
        synonyms: ["Devise", "Monnaie"]
    )
    
    static var caseDisplayRepresentations: [Currency: DisplayRepresentation] = [
        Currency.euro: "€",
        Currency.dollar: "$",
        Currency.franc: "₣",
    ]
    
    case euro
    case dollar
    case franc
    
    var code: String {
        switch self {
        case .euro: return "EUR"
        case .dollar: return "USD"
        case .franc: return "FRF"
        }
    }
}


@AssistantIntent(schema: .system.search)
struct ExampleSearchIntent: ShowInAppSearchResultsIntent {
    static var searchScopes: [StringSearchScope] = [.general]
    var criteria: StringSearchCriteria
    
    func perform() async throws -> some IntentResult {
        let searchString = criteria.term
        print("Searching for \(searchString)")
        // ...
        // Code that navigates to your app's search and enters the search string into a search field.
        // ...
        return .result {
            Text(searchString)
                .bold()
                .font(.largeTitle)
                .foregroundColor(.teal)
        }
    }
}

/**
 An `AppShortcut` wraps an intent to make it automatically discoverable throughout the system. An `AppShortcutsProvider` manages the shortcuts the app
 makes available. The app can update the available shortcuts by calling `updateAppShortcutParameters()` as needed.
 */
class WeroShortcuts: AppShortcutsProvider {
    
    /// The color the system uses to display the App Shortcuts in the Shortcuts app.
    static let shortcutTileColor = ShortcutTileColor.teal
    
    /**
     This sample app contains several examples of different intents, but only the intents this array describes make sense as App Shortcuts.
     Put the App Shortcut most people will use as the first item in the array. This first shortcut shouldn't bring the app to the foreground.
     
     Each phrase that people use to invoke an App Shortcut needs to contain the app name, using the `applicationName` placeholder in the provided
     phrase text, as well as any app name synonyms you declare in the `INAlternativeAppNames` key of the app's `Info.plist` file. You localize these
     phrases in a string catalog named `AppShortcuts.xcstrings`.
     
     - Tag: open_favorites_app_shortcut
     */
    static var appShortcuts: [AppShortcut] {
        /**
         Records activity on a trail, such as hiking. On Apple Watch, `StartTrailActivity` creates a workout session.
         
         Use the `$workoutStyle` parameter from the intent to allow people to ask the app to start tracking an activity by the
         activity name. The system creates an App Shortcut for each possible value in the `ActivityStyle` enumeration. The complete set of
         generated App Shortcuts for this intent are visible in the Shortcuts app, or by following the `ShortcutsLink` at the bottom of
         `SidebarColumn`.
         */
        AppShortcut(intent: WeroTransferIntent(), phrases: [
//            "Send \(\.$amount) to Pascal using in \(.applicationName)",
//            "Wero \(\.$amount) to Pascal in \(.applicationName)",
            "Send money in \(.applicationName)",
            "Transfer money in \(.applicationName)",
        ],
        shortTitle: "Wero Transfer",
        systemImageName: "creditcard")
    }
}
