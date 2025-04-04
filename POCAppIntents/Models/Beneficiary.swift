import AppIntents

struct Beneficiary: AppEntity {
    
    static var typeDisplayRepresentation: TypeDisplayRepresentation {
        TypeDisplayRepresentation(
            name: "Bénéficiaire"
        )
    }
    
    var displayRepresentation:  DisplayRepresentation {
        DisplayRepresentation(
            title: LocalizedStringResource("%@", defaultValue: String.LocalizationValue(name)),
            subtitle: LocalizedStringResource("%@", defaultValue: String.LocalizationValue(accountNumber)),
            image: .init(systemName: "person.fill"),
            synonyms: [
                "Destinataire",
            ]
        )
    }
    
    static var defaultQuery = BeneficiaryQuery()
    
    var id: String {
        accountNumber
    }
    
    @Property(title: "Nom du bénéficiare")
    var name: String
    
    @Property(title: "Numéro de compte")
    var accountNumber: String
    
    init(name: String, accountNumber: String) {
        self.name = name
        self.accountNumber = accountNumber
    }
}

struct BeneficiaryQuery: EntityQuery {
    
    static let pascal = Beneficiary(name: "Pascal", accountNumber: "FR7612345678901234567890123")
    
    static let allEntities = [
        pascal,
        Beneficiary(name: "Jean", accountNumber: "FR7612345678901234567890124"),
        Beneficiary(name: "Emilie", accountNumber: "FR7612345678901234567890125"),
        Beneficiary(name: "Marie", accountNumber: "FR7612345678901234567890126"),
        Beneficiary(name: "Pierre", accountNumber: "FR7612345678901234567890127"),
        Beneficiary(name: "Paul", accountNumber: "FR7612345678901234567890128"),
        Beneficiary(name: "Jacques", accountNumber: "FR7612345678901234567890129"),
    ]
    
    func suggestedEntities() async throws -> [Beneficiary] {
        [Self.pascal]
    }
    
    func entities(for identifiers: [Beneficiary.ID]) async throws -> [Beneficiary] {
        Self.allEntities.filter { identifiers.contains($0.id) }
    }
    
    func entities(matching string: String) async throws -> [Beneficiary] {
        Self.allEntities.filter {
            $0.name.localizedStandardContains(string) || $0.accountNumber.localizedStandardContains(string)
        }
    }
}
