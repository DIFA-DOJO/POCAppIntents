//
//  Currency.swift
//  POCAppIntents
//
//  Created by f19876 on 04/04/2025.
//
import AppIntents

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
