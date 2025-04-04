//
//  MainAccountBalanceIntentExtension.swift
//  POCAppIntents
//
//  Created by f19876 on 26/03/2025.
//

import Intents
import Combine
import UIKit

class MainAccountBalanceHandler: NSObject, INSearchForAccountsIntentHandling {
    
    func handle(intent: INSearchForAccountsIntent, completion: @escaping (INSearchForAccountsIntentResponse) -> Void) {
        let response = INSearchForAccountsIntentResponse(
            code: .success,
            userActivity: nil
        )
        
        response.accounts = [
            .init(
                nickname: .init(spokenPhrase: "Test Account"),
                number: "Pakk",
                accountType: .debit,
                organizationName: nil,
                balance: .init(amount: 120000, currencyCode: "EUR"),
                secondaryBalance: .init(amount: 30000, balanceType: .money)
            )
        ]
        
        completion(response)
    }
}
