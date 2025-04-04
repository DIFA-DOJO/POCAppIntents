import AppIntents
import SwiftUI

struct BankAccountBalanceIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Solde bancaire"

    static var description = IntentDescription("Obtenez le solde de votre compte principal.")
    
    static var openAppWhenRun: Bool = false
    
    @MainActor
    func perform() async throws -> some IntentResult & ReturnsValue<Double> & ProvidesDialog & ShowsSnippetView {
    
        let bankAccount = BankAccountQuery.mainAccount
        
        return .result(
            value: bankAccount.balance,
            dialog: IntentDialog(
                // ⬇️ This is spoken by Siri
                full: "Vous avez \(bankAccount.balance.formatted(.currency(code: "EUR"))) sur votre compte bancaire.",
                systemImageName: "dollarsign.circle.fill"
            ),
            content: {
                HStack {
                    Text(bankAccount.balance.formatted(.currency(code: "EUR")))
                }
                .font(.largeTitle)
                .padding()
            })
    }
}

