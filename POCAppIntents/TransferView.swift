//
//  TransferView.swift
//  POCAppIntents
//
//  Created by f19876 on 04/04/2025.
//
import SwiftUI

struct TransferView: View {
    
    let request: WeroTransferRequest
    let completion: () -> Void
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Transfert d'argent")
                    .font(.title)
                    .padding()
                
                Text("Montant : \(request.amount.formatted(.currency(code: request.currency.code)))")
                    .font(.headline)
                
                Text("A : \(request.beneficiary.name)")
                    .font(.headline)
                
                Button("Valider") {
                    completion()
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }
}

