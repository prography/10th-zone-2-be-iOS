//
//  LoginButton.swift
//  Zone2Be
//
//  Created by kangChangHyeok on 04/06/2025.
//

import SwiftUI

struct LoginButton: View {
    
    let imageName: String
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                // 중앙 텍스트
                Text(title)
                    .font(.system(size: 16, weight: .bold))

                // 왼쪽 아이콘 고정
                HStack {
                    Image(imageName)
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding([.leading, .top, .bottom], 14)
                    Spacer()
                }
            }
            .frame(height: 52)
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    LoginButton(imageName: "kakaoLogo", title: "카카오 로그인") {
        print("로그인")
    }
}
