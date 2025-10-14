import SwiftUI
import SwiftData

@main
struct ucihousingApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    @State private var isLoggedIn = false  // Track login state

    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                ContentView(isLoggedIn: $isLoggedIn)
            } else {
                LoginView(onLoginSuccess: {
                    withAnimation {
                        isLoggedIn = true
                    }
                })
            }
        }
        .modelContainer(sharedModelContainer)
    }
}
