import AppIntents

/**
 An `AppShortcut` wraps an intent to make it automatically discoverable throughout the system. An `AppShortcutsProvider` manages the shortcuts the app
 makes available. The app can update the available shortcuts by calling `updateAppShortcutParameters()` as needed.
 */
class ShortcutsProvider: AppShortcutsProvider {
    
    /// The color the system uses to display the App Shortcuts in the Shortcuts app.
    static let shortcutTileColor = ShortcutTileColor.teal
    
    /**
     This sample app contains several examples of different intents, but only the intents this array describes make sense as App Shortcuts.
     Put the App Shortcut most people will use as the first item in the array. This first shortcut shouldn't bring the app to the foreground.
     
     Each phrase that people use to invoke an App Shortcut needs to contain the app name, using the `applicationName` placeholder in the provided
     phrase text, as well as any app name synonyms you declare in the `INAlternativeAppNames` key of the app's `Info.plist` file. You localize these
     phrases in a string catalog named `AppShortcuts.xcstrings`.
     */
    
    static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: WeroTransferIntent(),
            phrases: [
                // ✅
                "Envoie un \(.applicationName)",
                "Envoie de l'argent avec \(.applicationName)",
                "Transfère de l'argent avec \(.applicationName)",
                "Transfert d'argent avec \(.applicationName)",
                "Virement \(.applicationName)",
                "Faire un virement avec \(.applicationName)",
                "Faire un \(.applicationName)",
                
                // ⚠️ Phrases that do not contain the application name are invalid
                "Transfère 5 cochons à Pascal",
                
                // ⚠️ Phrases that contains parameter (other than application name) does not seem to work
                "Transfère \(\.$amount) avec \(.applicationName)",
                "Transfère de l'argent à \(\.$beneficiary) avec \(.applicationName)",
            ],
            shortTitle: "Envoie de l'argent avec Wero",
            systemImageName: "creditcard"
        )
    }
}
