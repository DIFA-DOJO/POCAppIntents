//
//  POCAppIntentsApp.swift
//  POCAppIntents
//
//  Created by f19876 on 21/03/2025.
//

import SwiftUI

@main
struct POCAppIntentsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    print("Appeared!")
                }
        }
    }
}
