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
class AuthViewModel: ObservableObject {
    @Published var email: String = ""

    func login() {
        // TODO: call APIClient later
        
        print("Logging in with \(email)")
        
        // temp success
        SessionStore.shared.isLoggedIn = true
    }
}
