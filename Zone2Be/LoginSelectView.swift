//
//  LoginSelectView.swift
//  Zone2Be
//
//  Created by kangChangHyeok on 29/05/2025.
//

import SwiftUI
import AuthenticationServices

struct LoginSelectView: View {
    
    @State private var showAgreementSheet = false
    @State private var navigateToBodyInfo = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 40) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("가성비 있게 운동하기")
                        .textStyle(.h1)
                    Text("로그인 및 회원가입 수단을 선택해주세요")
                        .textStyle(.h3)
                }
                .padding(.horizontal, 20)
                .padding(.top, 37)
                
                VStack(spacing: 8) {
                    // 카카오 로그인
                    LoginButton(imageName: "kakaoLogo", title: "카카오 로그인", action: {
                        print("카카오 로그인")
                    })
                    .background(Color(hex: "#FAE24C"))
                    .foregroundStyle(.black)
                    .cornerRadius(8)
                    // 네이버 로그인
                    LoginButton(imageName: "naverLogo", title: "네이버 로그인", action: {
                        print("네이버 로그인")
                    })
                    .background(Color.init(hex: "#5EC23B"))
                    .foregroundStyle(.white)
                    .cornerRadius(8)
                    // 애플 로그인
                    ZStack {
                        SignInWithAppleButton { request in
                            print(request)
                        } onCompletion: { authorization in
                            print("authorization")
                        }
                        LoginButton(imageName: "appleLogo", title: "애플 로그인") {
                        }
                        .background(Color.black)
                        .allowsHitTesting(false)
                    }
                    .frame(maxHeight: 52)
                    .foregroundStyle(.white)
                    .background(Color.black)
                    .cornerRadius(8)
                    
                    LoginButton(imageName: "googleLogo", title: "구글 로그인", action: {
                        onLoginTapped()
                    })
                    .background(Color.init(hex: "#ffffff"))
                    .foregroundStyle(.black)
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    })
                    
                }
                .padding(.horizontal, 20)
            }
            .navigationDestination(isPresented: $navigateToBodyInfo) {
                BodyInfoInputView()
            }
            Spacer()
        }
        .task {
            let center = UNUserNotificationCenter.current()
            do {
                try await center.requestAuthorization(options: [.alert, .sound, .badge])
            } catch {
                // Handle the error here.
            }
        }
        .sheet(
            isPresented: $showAgreementSheet) {
            AgreementBottomSheet(isPresented: $showAgreementSheet, confirmButtonDidTap: $navigateToBodyInfo)
                .presentationCornerRadius(16)
        }
    }
    
    private func onLoginTapped() {
            showAgreementSheet = true
    }
}

#Preview {
    LoginSelectView()
}
