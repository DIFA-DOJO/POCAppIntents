import AppIntents
import SwiftUI

struct AccountWeatherIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Météo du compte"

    static var description = IntentDescription("Obtenez la météo de votre compte principal.")
    
    static var openAppWhenRun: Bool = false
    
    @MainActor
    func perform() async throws -> some IntentResult & ReturnsValue<Weather> & ProvidesDialog & ShowsSnippetView {
    
        let weather = Weather.allCases.randomElement()!
        
        let imageName = switch weather {
        case .sunny: "sun.max.fill"
        case .cloudy: "cloud.fill"
        case .rainy: "cloud.rain.fill"
        }
        
        let dialog = switch weather {
        case .sunny:
            IntentDialog(
                full: "Le soleil brille !",
                systemImageName: imageName
            )
        case .cloudy:
            IntentDialog(
                full: "Le temps est nuageux !",
                systemImageName: imageName
            )
        case .rainy:
            IntentDialog(
                full: "Le temps est orageux !",
                systemImageName: imageName
            )
        }
        
        return .result(
            value: weather,
            dialog: dialog,
            content: {
                HStack {
                    switch weather {
                    case .sunny:
                        Image(systemName: imageName)
                    case .cloudy:
                        Image(systemName: imageName)
                    case .rainy:
                        Image(systemName: imageName)
                    }
                }
                .font(.largeTitle)
                .padding()
            }
        )
    }
}

