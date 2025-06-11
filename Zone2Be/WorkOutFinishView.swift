//
//  WorkOutFinishView.swift
//  Zone2Be
//
//  Created by kangChangHyeok on 09/06/2025.
//

import SwiftUI

struct WorkOutFinishView: View {
    
    @Binding var stack: NavigationPath
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("운동 완료!")
                .textStyle(.h1)

            Text("운동 한 결과를 요약했어요")
                .textStyle(.h3)
                .foregroundStyle(Color.gray5)
                .frame(maxWidth: .infinity, alignment: .leading)

            Spacer()

            Button("확인") {
                stack = .init()
            }
            .frame(maxWidth: .infinity, minHeight: 52)
            .background(Color.brandColor)
            .foregroundStyle(Color.white)
            .textStyle(.h3)
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        .padding(.horizontal, 20)
        .padding(.top, 24)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(hex: "#FAFCFF"))
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    WorkOutFinishView(stack: .constant(NavigationPath()))
}
