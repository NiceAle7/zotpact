//
//  LoginView.swift
//  ucihousing
//
//  Created by Alejandro Olivares-Lopez on 4/2/26.
//
import SwiftUI

struct LoginView: View {
    @StateObject private var vm = AuthViewModel()

    var body: some View {
        ZStack {
            Color(red: 47/255, green: 67/255, blue: 86/255)
                .ignoresSafeArea()
            
            VStack {
                // Header
                HStack {
                    Image("roompact_logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 100)

                    Text("ZOTPACT") // 🔥 change branding
                        .font(.custom("Square721BT-BoldExtended", size: 36))
                        .foregroundColor(.white)
                        .tracking(2)
                }
                .padding()
                
                Spacer().frame(height: 6)
                
                VStack(spacing: 16) {
                    Text("Login to Roompact")
                        .font(.title2)
                        .bold()
                    
                    Text("Please enter the email provided by your institution")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                    
                    TextField("Email", text: $vm.email)
                        .textInputAutocapitalization(.never)
                        .padding(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 0.5)
                        )
                        .padding(.horizontal)
                    
                    Button {
                        vm.login()
                    } label: {
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
            }
        }
    }
}

#Preview {
    LoginView()
}
