import AppIntents
import SwiftUI

struct WeroTransferIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Envoie d'argent avec Wero"

    static var description = IntentDescription("Woof woof!")
    
    static var openAppWhenRun: Bool = false
    
    @Parameter(
        title: "Montant",
        requestValueDialog: IntentDialog(
            full: "Combien d'argent voulez-vous envoyer?",
            systemImageName: "dollarsign.circle.fill"
        )
    )
    var amount: Double
    
    @Parameter(title: "Devise", default: .euro)
    var currency: Currency
    
    @Parameter(
        title: "Bénéficiaire",
        requestValueDialog: IntentDialog(
            full: "A qui voulez-vous envoyer de l'argent?",
            systemImageName: "person.circle.fill"
        )
    )
    var beneficiary: Beneficiary
    
    @MainActor
    func perform() async throws -> some IntentResult & ProvidesDialog & ShowsSnippetView {
        .result(
            dialog: IntentDialog(
                // ⬇️ This is spoken by Siri
                full: "Yeah!",
                
                // ⬇️ This is displayed by the interface
                supporting: "\(amount.formatted(.currency(code: currency.code))) envoyés à \(beneficiary)…",
                systemImageName: "dollarsign.circle.fill"
            ),
            content: {
                Text("💸💸💸")
                    .font(.largeTitle)
                    .padding()
            })
    }
}

