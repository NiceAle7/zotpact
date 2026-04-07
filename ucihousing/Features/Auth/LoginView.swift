import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct LoginView: View {
    @StateObject private var vm = AuthViewModel()
    
    var body: some View {
        if vm.isLoggedIn{
            ContentView(isLoggedIn: $vm.isLoggedIn)
        }else{
            ZStack {
                // Background color
                Color(red: 47/255, green: 67/255, blue: 86/255)
                    .ignoresSafeArea()
                
                VStack {
                    // Header with logo + title
                    HStack {
                        Image("roompact_logo")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30, height: 100)
                        
                        Text("ROOMPACT")
                            .font(.custom("Square721BT-BoldExtended", size: 36))
                            .foregroundColor(.white)
                            .tracking(2)
                    }
                    .padding()
                    
                    Spacer().frame(height: 6)
                    
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
                        
                        
                        // Email login
                        Button(action: {
                            withAnimation {
                                vm.signInWithGoogle()
                                
                            }
                        }) {
                            Text("Login")
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color(red: 47/255, green: 67/255, blue: 86/255))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        .padding(.top, 8)
                        .frame(height: 50)
                        .padding(.horizontal)
                        
                        // Error message (if any)
                        if let error = vm.errorMessage {
                            Text(error)
                                .foregroundColor(.red)
                                .font(.footnote)
                        }
                        
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
}

#Preview {
    LoginView()
}
