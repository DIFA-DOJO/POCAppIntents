import SwiftUI

struct DefineTransferView: View {
    let completion: (Double) -> Void
    @State var amount: Double = 0
    var body: some View {
        ScrollView {
            VStack {
                TextField("Montant", value: $amount, format: .currency(code: "EUR"))
                
                Button("Valider") {
                    completion(amount)
                }
            }
        }
    }
}
