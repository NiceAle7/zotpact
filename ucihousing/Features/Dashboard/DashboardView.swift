//
//  DashboardView.swift
//  ucihousing
//
//  Created by Alejandro Olivares-Lopez on 4/2/26.
//

import SwiftUI
import SwiftData

// 🔹 MAIN VIEW
struct ContentView: View {
    @Binding var isLoggedIn: Bool
    @State private var selectedScreen: String? = nil
    
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Item.timestamp, order: .forward) private var items: [Item]
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            DashboardHeaderView(
                isLoggedIn: $isLoggedIn,
                selectedScreen: $selectedScreen
            )
            
            // Navigation
            NavigationStack {
                switch selectedScreen {
                case "forms":
                    FormsView()
                case "agreements":
                    RoommateView()
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
}

//PREVIEW
#Preview {
    ContentView(isLoggedIn: .constant(true))
        .modelContainer(try! ModelContainer(for: Schema([Item.self])))
}
