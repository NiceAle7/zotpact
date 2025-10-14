import SwiftUI

struct LoginView: View {
    var onLogin: () -> Void
    @State private var email = ""
    
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
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                            Text("ROOMPACT")
                                .font(.headline)
                                .foregroundColor(.white)
                                .tracking(2)
                            Spacer()
                        }
                        .padding()
                        
                        Spacer()
                        
                        // Login card
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Login to Roompact")
                                .font(.title2)
                            
                            Text("Your Housing and Residence Life Department uses our software to help you complete common tasks related to living on campus.")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            Text("Please the email provided by your institution")
                                .font(.subheadline)
                            
                            
                            TextField("", text: $email)
                                .padding(.vertical, 8)           // adds some vertical padding
                                .overlay(
                                    Rectangle()
                                        .frame(height: 1)        // thickness of underline
                                        .foregroundColor(.gray),  // color of underline
                                    alignment: .bottom
                                )
                                .padding(.horizontal)    
                            Button(action: {
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
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(radius: 8)
                        .padding(.horizontal, 24)
                        
                        Spacer()
                        
                        // Footer
                        Text("© 2025 Roompact, LLC | Terms & Privacy")
                            .font(.footnote)
                            .foregroundColor(.white.opacity(0.7))
                            .padding(.bottom, 16)
                    }
                }
            }
}

// Preview
#Preview {
    LoginView {
        print("Login tapped")
    }
}

