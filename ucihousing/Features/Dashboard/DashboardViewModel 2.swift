//import Foundation
//import SwiftUI
//
//@MainActor
//final class DashboardViewModel: ObservableObject {
//    // Represents the currently selected dashboard tab/screen
//    @Published var selectedScreen: DashboardScreen = .home
//
//    // Authentication state used by HeaderView binding
//    @Published var isLoggedIn: Bool = false
//
//    // Items displayed by DefaultDashboardView
//    @Published var items: [String] = []
//
//    init() {
//        // Seed with some placeholder data so the default view can render
//        self.items = ["Welcome", "Getting Started", "Tips"]
//    }
//}
//
//// Minimal enum to satisfy switch in DashboardView
//// Update cases to match your app as needed.
//enum DashboardScreen {
//    case home
//    case forms
//    case schedule
//    case events
//}
