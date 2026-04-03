//
//  HeaderView.swift
//  ucihousing
//
//  Created by Alejandro Olivares-Lopez on 4/3/26.
//
import SwiftUI
import SwiftData

struct DashboardHeaderView: View {
    @Binding var isLoggedIn: Bool
    @Binding var selectedScreen: String?
    
    var body: some View {
        HStack(spacing: 20) {
            Image("roompact_logo")
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 80)
            
            Spacer()
            
            HStack(spacing: 5) {
                Menu {
                    Button("Forms") { selectedScreen = "forms" }
                    Button("Schedule") { selectedScreen = "schedule" }
                    Button("Events") { selectedScreen = "events" }
                    Button("Attendance") { selectedScreen = "attendance" }
                    Button("Agreements") { selectedScreen = "agreements" }
                } label: {
                    Image("profile_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 80)
                }
                
                Menu {
                    Button("Support") { selectedScreen = "support" }
                    Button("FAQ") { selectedScreen = "faq" }
                } label: {
                    Image("speech_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 80)
                }
                
                Menu {
                    Button("Profile Settings") { selectedScreen = "profile" }
                    Button("Logout") { isLoggedIn = false }
                } label: {
                    Image("dropdown_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 80)
                }
            }
        }
        .padding(.horizontal, 10)
        .background(Color.black)
    }
}
