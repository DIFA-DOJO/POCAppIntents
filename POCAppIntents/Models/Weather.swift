import AppIntents

enum Weather: Int, AppEnum, CaseIterable {
    
    static var typeDisplayRepresentation = TypeDisplayRepresentation(
        name: "Météo"
    )
    
    static var caseDisplayRepresentations: [Self: DisplayRepresentation] = [
        Weather.cloudy: DisplayRepresentation(title: "Nuageux", image: .init(systemName: "cloud.fill")),
        Weather.rainy: DisplayRepresentation(title: "Orageux", image: .init(systemName: "cloud.rain.fill")),
        Weather.sunny: DisplayRepresentation(title: "Ensoleillé", image: .init(systemName: "sun.max.fill")),
    ]
    
    case cloudy
    case rainy
    case sunny
}
