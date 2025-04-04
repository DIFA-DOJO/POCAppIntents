import AppIntents
import SwiftUI

struct WeroTransferRequest: Identifiable {
    let id = UUID()
    let amount: Double
    let currency: Currency
    let beneficiary: Beneficiary
}

struct WeroTransferHandler {
    
    @MainActor
    func callAsFunction(request: WeroTransferRequest) {
        handle(request)
    }
    
    let handle: @MainActor (WeroTransferRequest) -> Void
}

struct WeroTransferInAppIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Envoie d'argent avec Wero"

    static var description = IntentDescription("Woof woof!")
        
    static var openAppWhenRun: Bool = true // 👈
    
    @AppDependency
    var weroTransferHandler: WeroTransferHandler
    
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
    func perform() async throws -> some IntentResult {
        weroTransferHandler.handle(
            WeroTransferRequest(
                amount: amount,
                currency: currency,
                beneficiary: beneficiary
            )
        )
        
        return .result()
    }
}
