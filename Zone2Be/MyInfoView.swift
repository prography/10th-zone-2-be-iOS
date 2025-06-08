//
//  MyInfoView.swift
//  Zone2Be
//
//  Created by kangChangHyeok on 06/06/2025.
//

import SwiftUI

struct MyInfoView: View {
    var body: some View {
        NavigationStack {
            List {
                
                // MARK: - 상단 헤더
                
                VStack(alignment: .leading) {
                    Spacer()
                        .frame(height: 44)
                    HStack {
                        Spacer()
                            .frame(width: 20)
                        Text("안녕하세요")
                            .textStyle(.h1)
                            .foregroundStyle(Color.gray3)
                            .fontWeight(.medium)
                    
                        Text("정원주")
                            .textStyle(.h1)
                        Text("님")
                            .foregroundStyle(Color.gray3)
                            .textStyle(.h1)
                            .fontWeight(.medium)
                        Spacer()
                    }
                    
                    Spacer()
                        .frame(height: 32)
                }
                .background(Color.init(hex: "#FAFCFF"))
                .frame(maxWidth: .infinity)
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets())
                
                // MARK: - 구분선
                
                Divider()
                    .foregroundStyle(Color.gray3)
                    .listRowInsets(EdgeInsets())
                
                // MARK: - 신체정보 수정, 계정 확인
                
                HStack(spacing: 8) {
                    Button(action: {}) {
                        VStack {
                            Image("pencil", bundle: nil)
                            Text("신체정보 수정")
                                .textStyle(.h3)
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color.white.opacity(0.2))
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                    .padding(.bottom, 24)
                    Divider()
                        .foregroundStyle(Color.gray3)
                        .frame(height: 72)
                    Button(action: {}) {
                        VStack {
                            Image("lock", bundle: nil)
                            Text("계정확인")
                                .textStyle(.h3)
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color.white.opacity(0.2))
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                    .padding(.bottom, 24)
                }
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
                
                Divider()
                    .foregroundStyle(Color.gray3)
                    .listRowInsets(EdgeInsets())
                    .listRowSeparator(.hidden)
                
                // MARK: - 카테고리 항목(알림설정, 공지사항, 약관 및 정책, 고객센터)
                
                Section {
                    MenuRow(icon: "alarm", title: "알림설정")
                        .listRowSeparator(.hidden)
                    Divider()
                        .foregroundStyle(Color.gray3)
                        .listRowInsets(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                        .listRowSeparator(.hidden)
                    MenuRow(icon: "megaPhone", title: "공지사항")
                    Divider()
                        .foregroundStyle(Color.gray3)
                        .listRowInsets(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                        .listRowSeparator(.hidden)
                    MenuRow(icon: "file", title: "약관 및 정책")
                        .listRowSeparator(.hidden)
                    Divider()
                        .foregroundStyle(Color.gray3)
                        .listRowInsets(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    
                    MenuRow(icon: "question", title: "고객센터")
                        .listRowSeparator(.hidden)
                    Divider()
                        .foregroundStyle(Color.gray3)
                        .listRowInsets(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                        .listRowSeparator(.hidden)
                }
                
                // MARK: -  앱 버전
                
                Text("앱 버전 15.3.2")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding(.top, 8)
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .environment(\.defaultMinListRowHeight, 0)
            .navigationTitle("운동하기")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MenuRow: View {
    var icon: String
    var title: String
    
    var body: some View {
        HStack {
            Image(icon, bundle: nil)
                .frame(width: 24)
                
            Spacer()
                .frame(width: 16)
            Text(title)
                .textStyle(.h3)
                .alignmentGuide(.leading) { d in
                    d[.leading]
                }
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(Color.gray3)
        }
        .padding(.vertical, 24)
    }
}

#Preview {
    MyInfoView()
}
