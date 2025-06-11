//
//  WorkoutView.swift
//  Zone2Be
//
//  Created by kangChangHyeok on 08/06/2025.
//

import SwiftUI

struct WorkoutView: View {
    
    @Binding var stack: NavigationPath
    @State var isPause: Bool = false
    @State var showAlert: Bool = false
    @State var isFinished: Bool = false
    
    var body: some View {
//        NavigationStack {
            ZStack {
                VStack(spacing: 20) {
                    // Title
                    VStack(spacing: 8) {
                        Text("Zone2로 조깅 중")
                            .textStyle(.h1)
                            .foregroundColor(Color.brandColor)
                        Text("심박수를 이탈하면 알려드릴게요")
                            .font(.pretendard(.semibold, size: 16))
                            .foregroundColor(.gray)
                    }
                    .padding(.top, 24)

                    // MARK: - 총 운동 시간
                    CardView {
                        VStack(spacing: 8) {
                            Label("총 운동 시간", systemImage: "timer")
                                .font(.pretendard(.medium, size: 18))
                                .foregroundColor(Color.gray5)
                            Text("MM:SS")
                                .textStyle(.h1)
                        }
                    }

                    // MARK: - 현재 심박수
                    CardView {
                        VStack(spacing: 0) {
                            Label("현재 심박수", image: "heartPurse")
                                .font(.pretendard(.medium, size: 18))
                                .foregroundColor(Color.gray5)
                            Spacer()
                                .frame(height: 8)
                            Text("00bpm")
                                .textStyle(.h1)
                            Spacer()
                                .frame(height: 4)
                            Text("000-000 bpm 유지하기")
                                .font(.pretendard(.medium, size: 16))
                                .foregroundColor(Color.gray5)
                        }
                    }

                    // MARK: - 소모 칼로리
                    CardView {
                        VStack(spacing: 6) {
                            Text("소모 칼로리")
                                .font(.pretendard(.medium, size: 18))
                                .foregroundColor(Color.gray5)
                            Text("0Kcal")
                                .textStyle(.h1)
                        }
                    }

                    Spacer()

                    // Buttons
                    HStack(spacing: 16) {
                        Button(action: {
                            isPause.toggle()
                        }) {
                            
                            if isPause {
                                VStack(spacing: 8) {
                                    Image("start")
                                        .frame(width: 90, height: 90)
                                        .foregroundColor(Color.customBlack)
                                    Text("시작")
                                        .foregroundColor(Color.white)
                                        .frame(height: 26)
                                        .textStyle(.p1)
                                        .bold()
                                }
                                .padding(.top, 9)
                                .padding(.bottom, 16)
                                .frame(maxWidth: .infinity)
                                .background(Color.brandColor)
                                .cornerRadius(8)
                                .shadow(color: Color.white.opacity(0.25), radius: 12, x: 0, y: 4) // Drop shadow
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.white.opacity(0.1), lineWidth: 0.5)
                                )
                            } else {
                                VStack(spacing: 8) {
                                    Image("pause")
                                        .frame(width: 90, height: 90)
                                        .foregroundColor(Color.customBlack)
                                    Text("일시정지")
                                        .foregroundColor(Color.customBlack)
                                        .frame(height: 26)
                                        .textStyle(.p1)
                                        .bold()
                                }
                                .padding(.top, 9)
                                .padding(.bottom, 16)
                                .frame(maxWidth: .infinity)
                                .background(Color.white)
                                .cornerRadius(8)
                                .shadow(color: Color.white.opacity(0.25), radius: 12, x: 0, y: 4) // Drop shadow
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.white.opacity(0.1), lineWidth: 0.5)
                                )
                            }
                        }

                        Button(action: {
                            isPause = true
                            showAlert = true
                        }) {
                            VStack {
                                Image("stop")
                                    .frame(width: 90, height: 90)
                                    .foregroundColor(.blue)
                                Text("운동종료")
                                    .frame(height: 26)
                                    .textStyle(.p1)
                                    .bold()
                            }
                            .padding(.top, 9)
                            .padding(.bottom, 16)
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(8)
                            .shadow(color: Color.white.opacity(0.25), radius: 12, x: 0, y: 4) // Drop shadow
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.white.opacity(0.1), lineWidth: 0.5)
                            )
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal, 20)
                if showAlert {
                    AlertView(showAlert: $showAlert) {
                        isFinished = true
                    }
                }
            }
            .toolbarVisibility(.hidden, for: .tabBar)
            .background(Color(.systemGroupedBackground))
            .navigationDestination(isPresented: $isFinished) {
                WorkOutFinishView(stack: $stack)
            }
    }
}

struct CardView<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        content
            .padding(.vertical, 15.5)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .shadow(color: Color.white.opacity(0.25), radius: 12, x: 0, y: 4) // Drop shadow
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.white.opacity(0.1), lineWidth: 0.5)
            )
    }
}

#Preview {
    WorkoutView(stack: .constant(NavigationPath()))
}
