//
//  RootView.swift
//  ucihousing
//
//  Created by Alejandro Olivares-Lopez on 4/2/26.
//
import SwiftUI

struct RootView: View {
    @StateObject private var session = SessionStore.shared

    var body: some View {
        Group {
            if session.isLoggedIn {
            } else {
                LoginView()
            }
        }
    }
}
