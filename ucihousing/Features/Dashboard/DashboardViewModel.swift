////
////  DashboardViewModel.swift
////  ucihousing
////
////  Created by Alejandro Olivares-Lopez on 4/2/26.
////
//import SwiftUI
//class DashboardViewModel: ObservableObject {
//    @Published var isLoggedIn: Bool = true
//    @Published var selectedScreen: Screen? = nil
//    @Published var items: [Item] = []
//
//    enum Screen {
//        case forms, schedule, events, attendance, agreements, support, faq, profile
//    }
//}
import SwiftUI
import SwiftData
import Combine

class DashboardViewModel: ObservableObject {
    @Published var isLoggedIn: Bool = true
    @Published var selectedScreen: String? = nil
    
    // SwiftData items will be passed in from the view
}
