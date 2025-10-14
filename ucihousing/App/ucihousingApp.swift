import SwiftUI
import SwiftData

@main
struct uciHousingApp: App {
    @State private var isLoggedIn = false
    
    // Shared SwiftData container
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([Item.self])
        let config = ModelConfiguration(isStoredInMemoryOnly: false)
        do {
            return try ModelContainer(for: schema, configurations: [config])
        } catch {
            fatalError("Failed to create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            RootView(isLoggedIn: $isLoggedIn)
                .modelContainer(sharedModelContainer)
        }
    }
}

// RootView switches between login and main content
struct RootView: View {
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        if isLoggedIn {
            ContentView(isLoggedIn: $isLoggedIn)
        } else {
            LoginView {
                isLoggedIn = true
            }
        }
    }
}

