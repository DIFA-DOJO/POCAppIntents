import AppIntents

struct BankAccount: AppEntity {
    
    static var typeDisplayRepresentation: TypeDisplayRepresentation {
        TypeDisplayRepresentation(
            name: "Compte bancaire"
        )
    }
    
    var displayRepresentation:  DisplayRepresentation {
        DisplayRepresentation(
            title: LocalizedStringResource("%@", defaultValue: String.LocalizationValue(name)),
            image: .init(systemName: "dollarsign.bank.building.fill")
        )
    }
    
    static var defaultQuery = BankAccountQuery()
    
    let id = 1
    
    @Property(title: "Nom du compte")
    var name: String
    
    @Property(title: "Solde du compte")
    var balance: Double
    
    init(name: String, balance: Double) {
        self.name = name
        self.balance = balance
    }
}

struct BankAccountQuery: EntityQuery {
    
    static let mainAccount = BankAccount(name: "Compte chèque", balance: 1_234_567.89)
    
    func suggestedEntities() async throws -> [BankAccount] {
        [Self.mainAccount]
    }
    
    func entities(for identifiers: [BankAccount.ID]) async throws -> [BankAccount] {
        [Self.mainAccount]
    }
    
    func entities(matching string: String) async throws -> [BankAccount] {
        [Self.mainAccount]
    }
}
