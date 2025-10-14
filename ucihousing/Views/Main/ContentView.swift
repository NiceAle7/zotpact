import SwiftUI
import SwiftData

struct ContentView: View {
    @Binding var isLoggedIn: Bool
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Item.timestamp, order: .forward) private var items: [Item]

    var body: some View {
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
            .navigationTitle("My Items")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Sign Out") {
                        withAnimation {
                            isLoggedIn = false
                        }
                    }
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: addItem) {
                        Image(systemName: "plus")
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

