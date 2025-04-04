//@AssistantIntent(schema: .system.search)
//struct ExampleSearchIntent: ShowInAppSearchResultsIntent {
//    static var searchScopes: [StringSearchScope] = [.general]
//    var criteria: StringSearchCriteria
//    
//    func perform() async throws -> some IntentResult {
//        let searchString = criteria.term
//        print("Searching for \(searchString)")
//        // ...
//        // Code that navigates to your app's search and enters the search string into a search field.
//        // ...
//        return .result {
//            Text(searchString)
//                .bold()
//                .font(.largeTitle)
//                .foregroundColor(.teal)
//        }
//    }
//}
