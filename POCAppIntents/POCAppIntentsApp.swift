import SwiftUI
import AppIntents

@main
struct POCAppIntentsApp: App {
    
    @State var transferRequest: WeroTransferRequest?
    
    @State var shouldDefineTransfer = false
    
    var body: some Scene {
        WindowGroup {
            ScrollView {
                VStack(spacing: 40) {
                    ShortcutsLink()
                    
                    SiriTipView(intent: WeroTransferInAppIntent())
                    
                    SiriTipView(intent: AccountBalanceIntent())
                    
                    SiriTipView(intent: AccountWeatherIntent())
                    
                    Button("Faire un transfert") {
                        shouldDefineTransfer = true
                    }
                }
                .padding()
            }
            .sheet(isPresented: $shouldDefineTransfer) {
                DefineTransferView { amount in
                    shouldDefineTransfer = false
                    transferRequest = WeroTransferRequest(
                        amount: amount,
                        currency: .euro,
                        beneficiary: BeneficiaryQuery.emilie
                    )
                }
            }
            .sheet(item: $transferRequest) { request in
                TransferView(request: request) {
                    transferRequest = nil
                }
            }
            .onAppear {
                AppDependencyManager.shared.add {
                    WeroTransferHandler(handle: self.handle)
                }
            }
        }
    }
    
    func handle(_ request: WeroTransferRequest) {
        transferRequest = request
    }
}
