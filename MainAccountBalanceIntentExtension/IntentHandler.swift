//
//  IntentHandler.swift
//  MainAccountBalanceIntentExtension
//
//  Created by f19876 on 26/03/2025.
//

import Intents

class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        if intent is INSearchForAccountsIntent {
            return MainAccountBalanceHandler()
        }
        
        return self
    }
    
}
