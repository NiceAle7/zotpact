//
//  AuthViewModel.swift
//  ucihousing
//
//  Created by Alejandro Olivares-Lopez on 4/2/26.
//
//import Foundation
//


import Foundation
import Combine

#if canImport(UIKit)
import UIKit
#endif

#if canImport(GoogleSignIn)
import GoogleSignIn
#endif

class AuthViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var errorMessage: String?
    @Published var isLoggedIn: Bool = false
    
    // MARK: - Email Login
    func login() {
        print("Logging in with \(email)")
        
        // TODO: Replace with real API call
        isLoggedIn = true
    }
    
    // MARK: - Google Sign-In
    func signInWithGoogle() {
#if canImport(UIKit) && canImport(GoogleSignIn)
        guard let rootViewController =
                UIApplication.shared.connectedScenes
                    .compactMap({ ($0 as? UIWindowScene)?.keyWindow })
                    .first?.rootViewController else {
            print("❌ No root VC")
            return
        }

        GIDSignIn.sharedInstance.signIn(
            withPresenting: rootViewController
        ) { [weak self] result, error in
            
            if let error = error {
                DispatchQueue.main.async {
                    self?.errorMessage = error.localizedDescription
                }
                print("❌ Google error: \(error)")
                return
            }

            guard let user = result?.user else { return }

            let email = user.profile?.email ?? ""
            print("✅ Google user: \(email)")
            
            // 🔒 Restrict to UCI emails if needed
            if email.hasSuffix("@uci.edu") {
                DispatchQueue.main.async {
                    self?.isLoggedIn = true
                }
            } else {
                DispatchQueue.main.async {
                    self?.errorMessage = "Please use your UCI email"
                }
            }
        }
#else
        errorMessage = "Google Sign-In is only available on iOS."
#endif
    }
}
