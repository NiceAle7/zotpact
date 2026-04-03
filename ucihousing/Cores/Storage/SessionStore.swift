//
//  SessionStore.swift
//  ucihousing
//
//  Created by Alejandro Olivares-Lopez on 4/2/26.
//

import Foundation
import Combine

class SessionStore: ObservableObject {
    static let shared = SessionStore()

    @Published var isLoggedIn: Bool = false
}
