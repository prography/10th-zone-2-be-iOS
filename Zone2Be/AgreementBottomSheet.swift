//
//  AgreementBottomSheet.swift
//  Zone2Be
//
//  Created by kangChangHyeok on 04/06/2025.
//

import SwiftUI

struct AgreementBottomSheet: View {
    @Binding var isPresented: Bool
    @Binding var confirmButtonDidTap: Bool

    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                isPresented = false
            }) {
                Image("xmarkImage", bundle: nil)
                    .resizable()
                    .frame(width: 24, height: 24)
            }
        }
        .padding([.top, .trailing], 12)
        VStack {
            HStack {
                Text("간편가입 약관에 동의해주세요.")
                    .textStyle(.h2)
                Spacer()
            }
            Spacer()
                .frame(height: 40)
            VStack(spacing: 12) {
                AgreementRow(title: "(필수) 서비스 이용약관")
                AgreementRow(title: "(필수) 개인정보 수집 동의")
            }
            Spacer()
                .frame(height: 44)
            Button(action: {
                isPresented = false
                confirmButtonDidTap = true
            }) {
                Text("전체 동의하기")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16.5)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .textStyle(.p1)
                    .bold()
            }
            Spacer()
        }
        .padding(.horizontal, 20)
        .presentationDetents([.height(286)])
    }
}

struct AgreementRow: View {
    var title: String

    var body: some View {
        HStack(spacing: 4) {
            Text(title)
                .textStyle(.p1)
                .bold()
                .padding(.vertical, 4)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundStyle(.black)
                .bold()
        }
    }
}

#Preview {
    AgreementBottomSheet(isPresented: .constant(true), confirmButtonDidTap: .constant(false))
}
