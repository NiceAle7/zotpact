import SwiftUI
import SwiftData

struct LoginView: View {
    @State private var email: String = ""
    @State private var showError: Bool = false
    @State private var errorMessage: String = ""

    // Callback for login success
    var onLoginSuccess: () -> Void

    var body: some View {
        VStack(spacing: 32) {
            Image("roompact_logo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 60)
                .padding(.top, 60)

            Text("Login to Roompact")
                .font(.title)
                .bold()

            Text("Your Housing and Residence Life Department uses our software to help you complete common tasks related to living on campus.")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .padding(.horizontal, 24)

            VStack(alignment: .leading, spacing: 8) {
                TextField("Enter your institutional email", text: $email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(UIColor.secondarySystemFill))
                    .cornerRadius(8)

                if showError {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.footnote)
                }
            }
            .padding(.horizontal, 24)

            Button(action: {
                validateAndProceed()
            }) {
                Text("Continue")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.horizontal, 24)

            Spacer()

            Text("© 2025 Roompact, LLC | Terms & Privacy")
                .font(.footnote)
                .foregroundColor(.secondary)
                .padding(.bottom, 20)
        }
        .ignoresSafeArea(edges: .top)
    }

    private func validateAndProceed() {
        if email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            showError = true
            errorMessage = "Please enter your email"
        } else if !email.contains("@") {
            showError = true
            errorMessage = "That does not look like an email address"
        } else {
            showError = false
            // Call the success callback to switch views
            onLoginSuccess()
        }
    }
}

struct ContentView: View {
    // Binding to app state so content view can sign out
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
        do {
            try modelContext.save()
        } catch {
            print("Failed to save item: \(error)")
        }
    }

    private func deleteItems(at offsets: IndexSet) {
        offsets.forEach { index in
            let item = items[index]
            modelContext.delete(item)
        }
        do {
            try modelContext.save()
        } catch {
            print("Failed to delete items: \(error)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(isLoggedIn: .constant(true))
            .modelContainer(try! ModelContainer(for: Schema([Item.self])))
    }
}

