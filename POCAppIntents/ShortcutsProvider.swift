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
            intent: AccountWeatherIntent(),
            phrases: [
                "Afficher la météo du compte \(.applicationName)",
                "Quelle est la météo de mon compte \(.applicationName)",
                "Comment se porte mon compte \(.applicationName)",
                "Quel est le temps sur mon compte \(.applicationName)",
            ],
            shortTitle: "Météo bancaire",
            systemImageName: "sun.max.fill"
        )
        
        AppShortcut(
            intent: AccountBalanceIntent(),
            phrases: [
                "Afficher mon solde bancaire \(.applicationName)",
                "Combien j'ai sur mon compte \(.applicationName) ?",
                "Combien j'ai sur mon compte chèque  \(.applicationName) ?",
                "Combien j'ai d'argent sur mon compte chèque \(.applicationName) ?",
                "Combien j'ai d'argent sur mon compte \(.applicationName) ?",
                "Quel est mon solde \(.applicationName) ?",
            ],
            shortTitle: "Solde bancaire",
            systemImageName: "numbers.rectangle"
        )
        
        AppShortcut(
            intent: WeroTransferInAppIntent(),
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
                // -> Invalid Utterance. Every App Shortcut utterance should have one '${applicationName}' in it.
                // "Transfère 5 cochons à Pascal",
                
                // ⚠️ Phrases that contains parameter (other than application name) does not seem to work
                // -> Invalid parameter type. AppEntity and AppEnum are the only allowed types for amount
                // "Transfère \(\.$amount) avec \(.applicationName)",
                // "Transfère de l'argent à \(\.$beneficiary) avec \(.applicationName)",
            ],
            shortTitle: "Envoie de l'argent avec Wero",
            systemImageName: "creditcard"
        )
    }
}
