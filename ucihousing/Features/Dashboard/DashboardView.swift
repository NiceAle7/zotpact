////
////  DashboardView.swift
////  ucihousing
////
////  Created by Alejandro Olivares-Lopez on 4/2/26.
////
//
//import SwiftUI
//struct DashboardView: View {
//    @StateObject private var vm = DashboardViewModel()
//
//    var body: some View {
//        VStack(spacing: 0) {
//            
//            HeaderView(
//                isLoggedIn: $vm.isLoggedIn,
//                selectedScreen: $vm.selectedScreen
//            )
//
//            NavigationStack {
//                switch vm.selectedScreen {
//                case .forms:
//                    FormsView()
//                case .schedule:
//                    ScheduleView()
//                case .events:
//                    EventsView()
//                default:
//                    DefaultDashboardView(items: vm.items)
//                }
//            }
//        }
//    }
//}
