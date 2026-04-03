////
////  DashboardView.swift
////  ucihousing
////
////  Created by Alejandro Olivares-Lopez on 4/2/26.
////
//
//import SwiftUI
//struct DashboardView: View {
//    @StateObject private var vm = DashboardViewModel()
//
//    var body: some View {
//        VStack(spacing: 0) {
//            
//            HeaderView(
//                isLoggedIn: $vm.isLoggedIn,
//                selectedScreen: $vm.selectedScreen
//            )
//
//            NavigationStack {
//                switch vm.selectedScreen {
//                case .forms:
//                    FormsView()
//                case .schedule:
//                    ScheduleView()
//                case .events:
//                    EventsView()
//                default:
//                    DefaultDashboardView(items: vm.items)
//                }
//            }
//        }
//    }
//}

//
//  DashboardView.swift
//  ucihousing
//
//  Created by Alejandro Olivares-Lopez on 4/2/26.
//

import SwiftUI
import SwiftData

// 🔹 HEADER VIEW
struct HeaderView: View {
    @Binding var isLoggedIn: Bool
    @Binding var selectedScreen: String?
    
    var body: some View {
        HStack(spacing: 20) {
            Image("roompact_logo")
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 80)
            
            Spacer()
            
            HStack(spacing: 5) {
                Menu {
                    Button("Forms") { selectedScreen = "forms" }
                    Button("Schedule") { selectedScreen = "schedule" }
                    Button("Events") { selectedScreen = "events" }
                    Button("Attendance") { selectedScreen = "attendance" }
                    Button("Agreements") { selectedScreen = "agreements" }
                } label: {
                    Image("profile_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 80)
                }
                
                Menu {
                    Button("Support") { selectedScreen = "support" }
                    Button("FAQ") { selectedScreen = "faq" }
                } label: {
                    Image("speech_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 80)
                }
                
                Menu {
                    Button("Profile Settings") { selectedScreen = "profile" }
                    Button("Logout") { isLoggedIn = false }
                } label: {
                    Image("dropdown_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 80)
                }
            }
        }
        .padding(.horizontal, 10)
        .background(Color.black)
    }
}

// 🔹 MAIN VIEW
struct ContentView: View {
    @Binding var isLoggedIn: Bool
    @State private var selectedScreen: String? = nil
    
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Item.timestamp, order: .forward) private var items: [Item]
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            HeaderView(
                isLoggedIn: $isLoggedIn,
                selectedScreen: $selectedScreen
            )
            
            // Navigation
            NavigationStack {
                switch selectedScreen {
                case "forms":
                    FormsView()
                case "schedule":
                    ScheduleView()
                case "events":
                    EventsView()
                default:
                    // 🔹 Default Screen
                    ScrollView {
                        VStack(spacing: 20) {
                            // List Data
                            ForEach(items) { item in
                                HStack {
                                    Text(item.timestamp, style: .date)
                                    Spacer()
                                    Text(item.timestamp, style: .time)
                                        .foregroundColor(.secondary)
                                        .font(.caption)
                                }
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(8)
                            }
                            
                            // Rectangle Section
                            Rectangle()
                                .fill(Color.blue)
                                .frame(height: 100)
                                .cornerRadius(10)
                        }
                        .padding()
                    }
                }
            }
        }
    }
    
    // 🔹 DATA FUNCTIONS
    private func addItem() {
        let newItem = Item()
        modelContext.insert(newItem)
        try? modelContext.save()
    }
    
    private func deleteItems(at offsets: IndexSet) {
        offsets.forEach { index in
            let item = items[index]
            modelContext.delete(item)
        }
        try? modelContext.save()
    }
}

// 🔹 NEW SCREENS
struct FormsView: View {
    var body: some View {
        Text("Forms View")
    }
}

struct ScheduleView: View {
    var body: some View {
        Text("Schedule View")
    }
}

struct EventsView: View {
    var body: some View {
        Text("Events View")
    }
}

// 🔹 PREVIEW
#Preview {
    ContentView(isLoggedIn: .constant(true))
        .modelContainer(try! ModelContainer(for: Schema([Item.self])))
}
