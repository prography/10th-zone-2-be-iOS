//
//  AlertView.swift
//  Zone2Be
//
//  Created by kangChangHyeok on 08/06/2025.
//

import SwiftUI

struct AlertView: View {
    
    @Binding var showAlert: Bool
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            Color.black.opacity(0.25)
                .ignoresSafeArea()

            VStack(spacing: 32) {
                Text("운동을 마무리하시겠어요?")
                    .textStyle(.p1)
                    .bold()
                    .multilineTextAlignment(.center)

                HStack(spacing: 12) {
                    Button(action: {
                        showAlert = false
                    }) {
                        Text("취소")
                            .padding()
                            .foregroundColor(Color.gray5)
                            .bold()
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.init(hex: "#E0E0E0"))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                    Button(action: {
                        dismiss()
                    }) {
                        Text("운동 종료")
                            .padding()
                            .foregroundColor(.white)
                            .bold()
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .padding([.leading, .trailing, .bottom], 12)
            }
            .padding(.top, 32)
            .background(Color.white)
            .cornerRadius(20)
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity)
        }
        
    }
}

#Preview {
    AlertView(showAlert: .constant(true))
}
