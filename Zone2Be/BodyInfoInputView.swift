//
//  BodyInfoInputView.swift
//  Zone2Be
//
//  Created by kangChangHyeok on 04/06/2025.
//

import SwiftUI

struct BodyInfoInputView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var birth = ""
    @State private var height = ""
    @State private var weight = ""
    @State private var gender: String? = nil
    
    
    var backButton : some View {  // <-- 👀 커스텀 버튼
            Button{
                dismiss()
            } label: {
                Image("leftArrow", bundle: nil)
            }
        }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("지방연소 심박수 계산하기")
                    .textStyle(.h1)
                Spacer().frame(height: 8)
                Text("정확한 계산을 위해 신체정보를 입력해주세요.")
                    .textStyle(.h3)
                    .foregroundColor(Color.gray5)
                Spacer().frame(height: 44)
                
                Text("생년월일 *")
                    .textStyle(.p2)
                    .padding(.vertical, 3.5)
                    .padding(.leading, 8)
                Spacer()
                    .frame(height: 8)
                TextField("생년월일 6자리를 입력해주세요.", text: $birth)
                    .textStyle(.p2)
                    .fontWeight(.semibold)
                    .padding(.vertical, 13.5)
                    .padding(.leading, 16)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray3, lineWidth: 1)
                    }
                Spacer()
                    .frame(height: 32)
                Text("키(cm)")
                    .textStyle(.p2)
                    .padding(.vertical, 3.5)
                    .padding(.leading, 8)
                Spacer()
                    .frame(height: 8)
                TextField("키를 입력해주세요.", text: $height)
                    .textStyle(.p2)
                    .fontWeight(.semibold)
                    .padding(.vertical, 13.5)
                    .padding(.leading, 16)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray3, lineWidth: 1)
                    }
                Spacer()
                    .frame(height: 32)
                Text("몸무게(kg)")
                    .textStyle(.p2)
                    .padding(.vertical, 3.5)
                    .padding(.leading, 8)
                Spacer()
                    .frame(height: 8)
                TextField("몸무게를 입력해주세요.", text: $weight)
                    .textStyle(.p2)
                    .fontWeight(.semibold)
                    .padding(.vertical, 13.5)
                    .padding(.leading, 16)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray3, lineWidth: 1)
                    }
                Spacer()
                    .frame(height: 32)
                Text("성별 *")
                    .textStyle(.p2)
                    .padding(.vertical, 3.5)
                    .padding(.leading, 8)
                Spacer()
                    .frame(height: 8)
                HStack {
                    GenderButton(title: "남성", selected: gender == "남성") {
                        gender = "남성"
                    }
                    GenderButton(title: "여성", selected: gender == "여성") {
                        gender = "여성"
                    }
                }
                Spacer()
                Button(action: {
                    // 운동 시작 로직
                }) {
                    Text("운동 시작하기")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(8)
                }
                .disabled(true) // 입력값 검증 후 활성화 처리
                .padding(.top, 32)

            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("신체정보 입력")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                backButton
            }
        }
    }
}

struct GenderButton: View {
    var title: String
    var selected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(selected ? Color.blue : Color.gray3, lineWidth: 1)
                        .background(selected ? Color.init(hex: "#F2F8FF") : Color.clear)
                )
                .foregroundColor(selected ? .brandColor : .gray5)
                .textStyle(.p2)
                .fontWeight(.semibold)
        }
    }
}

#Preview {
    BodyInfoInputView()
}
