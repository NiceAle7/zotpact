import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @Binding var isLoggedIn: Bool
    
    var body: some View {
                ZStack {
                    // Background color
                    Color(red: 47/255, green: 67/255, blue: 86/255)
                        .ignoresSafeArea()
                    
                    VStack {
                        // Header with logo + title
                        HStack {
                            Image("roompact_logo") // placeholder for Roompact logo
                                .resizable()
                                .scaledToFill()
                                .frame(width: 30, height: 100)
                            Text("ROOMPACT")
                                .font(.custom("Square721BT-BoldExtended", size: 36))
                                .foregroundColor(.white)
                                .tracking(2)
                        }
                        .padding()
                        
                        Spacer().frame(height:6)
                        
                        // Login card
                        VStack(alignment: .center, spacing: 16) {
                            Text("Login to Roompact")
                                .font(.title2)
                                .bold()
                            
                            Text("Your Housing and Residence Life Department uses our software to help you complete common tasks related to living on campus.")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.center)
                            
                            Text("Please enter the email provided by your institution")
                                .font(.footnote)
                            
                            
                            
                            TextField("", text: $email)
                                .textInputAutocapitalization(.never)
                                .padding(12)           // adds some vertical padding
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 0.5)
                                )
                                .padding(.horizontal)    
                            Button(action: {
                                withAnimation{
                                    isLoggedIn = true
                                }
                                // handle login here
                            }) {
                                Text("Continue")
                                    .fontWeight(.semibold)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color(red: 47/255, green: 67/255, blue: 86/255))
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                            .padding(.top, 8)
                            Text("© 2026 Roompact, LLC | Terms & Privacy")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                                .padding(.bottom, 16)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(radius: 8)
                        .padding(.horizontal, 24)
                        
                    }
                }
            }
}


struct YourApp: App {
    @State private var isLoggedIn = false

    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                ContentView(isLoggedIn: $isLoggedIn)
            } else {
                LoginView(isLoggedIn: $isLoggedIn)
            }
        }
    }
}

#Preview {
    LoginView(isLoggedIn: .constant(false))
}
