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
                                .scaledToFill()
                                .frame(width: 30, height: 80)
                            Text("ROOMPACT")
                                .font(.custom("Square721BT-BoldExtended", size: 36))
                                .foregroundColor(.white)
                                .tracking(2)
                        }
                        .padding()
                        
                        Spacer()
                        
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
                                .padding(12)           // adds some vertical padding
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 0.5)
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
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(radius: 8)
                        .padding(.horizontal, 24)
                        
                        Spacer()
                        
                        // Footer
                        Text("© 2026 Roompact, LLC | Terms & Privacy")
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

