import AppIntents
import SwiftUI

struct WeroTransferIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Envoie d'argent avec Wero"

    static var description = IntentDescription("Woof woof!")
    
    static var openAppWhenRun: Bool = false
    
    @Parameter(title: "Montant")
    var amount: Double
    
    @Parameter(title: "Devise", default: .euro)
    var currency: Currency
    
    @MainActor
    func perform() async throws -> some IntentResult & ProvidesDialog & ShowsSnippetView {
        .result(
            dialog: IntentDialog(
                // ⬇️ This is spoken by Siri
                full: "Yeah!",
                
                // ⬇️ This is displayed by the interface
                supporting: "\(amount.formatted(.currency(code: currency.code))) sent to a random person…",
                systemImageName: "dollarsign.circle.fill"
            ),
            view: Text("💸💸💸").font(.largeTitle)
        )
    }
}

