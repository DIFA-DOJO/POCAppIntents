import SwiftUI
import AppIntents

@main
struct POCAppIntentsApp: App {
    
    var body: some Scene {
        WindowGroup {
            ScrollView {
                VStack(spacing: 40) {
                    ShortcutsLink()
                    
                    SiriTipView(intent: WeroTransferIntent())
                    
                    SiriTipView(intent: AccountBalanceIntent())
                    
                    SiriTipView(intent: AccountWeatherIntent())
                }
                .padding()
            }
        }
    }
}
