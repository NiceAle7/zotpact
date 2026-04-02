import SwiftUI
import SwiftData

struct HeaderView: View {
    @State private var selectedMenu1 = "Housing"
    @State private var selectedMenu2 = "Profile"
    @State private var selectedMenu3 = "Help"

    var body: some View {
        VStack{
            HStack(spacing: 20) {
                // Main logo
                Image("roompact_logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 80)
                
                Spacer()
                
                HStack(spacing: 1) { // small spacing between menu logos
                        Menu {
                            Button("Forms") {}
                            Button("Schedule") {}
                            Button("Events") {}
                            Button("Attendance") {}
                            Button("Argeements") {}
                        } label: {
                            Image("profile_logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 80)
                        }
                        
                        Menu {
                            Button("Support") {}
                            Button("FAQ") {}
                        } label: {
                            Image("speech_logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 80)
                        }
                        
                        Menu {
                            Button("Profile Settings") {}
                            Button("Logout") {}
                        } label: {
                            Image("dropdown_logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 80)
                        }
                    }
                
            }
            .padding(.horizontal, 10)
            .background(Color.black) // <- black background
        }
        Spacer()
    }


    @Binding var isLoggedIn: Bool
}

struct ContentView: View {
    @Binding var isLoggedIn: Bool
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Item.timestamp, order: .forward) private var items: [Item]

    var body: some View {
        VStack(spacing: 0) {
            HeaderView(isLoggedIn: $isLoggedIn)

            NavigationView {
                List {
                    ForEach(items) { item in
                        HStack {
                            Text(item.timestamp, style: .date)
                            Spacer()
                            Text(item.timestamp, style: .time)
                                .foregroundColor(.secondary)
                                .font(.caption)
                        }
                        .padding(.vertical, 6)
                    }
                    .onDelete(perform: deleteItems)
                }
                .navigationTitle("")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: addItem) {
                        }
                    }
                }
            }
        }
    }

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

#Preview {
    ContentView(isLoggedIn: .constant(true))
        .modelContainer(try! ModelContainer(for: Schema([Item.self])))
}


