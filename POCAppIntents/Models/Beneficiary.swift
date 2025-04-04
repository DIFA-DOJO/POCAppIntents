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
    static let jean = Beneficiary(name: "Jean", accountNumber: "FR7612345678901234567890124")
    static let emilie = Beneficiary(name: "Emilie", accountNumber: "FR7612345678901234567890125")
    static let marie = Beneficiary(name: "Marie", accountNumber: "FR7612345678901234567890126")
    static let pierre = Beneficiary(name: "Pierre", accountNumber: "FR7612345678901234567890127")
    static let paul = Beneficiary(name: "Paul", accountNumber: "FR7612345678901234567890128")
    static let jacques = Beneficiary(name: "Jacques", accountNumber: "FR7612345678901234567890129")
    
    static let allEntities = [
        pascal, jean, emilie, marie, pierre, paul, jacques,
    ]
    
    func suggestedEntities() async throws -> [Beneficiary] {
        Self.allEntities
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
