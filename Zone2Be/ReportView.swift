//
//  ReportView.swift
//  Zone2Be
//
//  Created by kangChangHyeok on 06/06/2025.
//

import SwiftUI

struct ReportView: View {
    
    @State var activitiesByDate: [DayActivity] = [
        DayActivity(date: "05.22(목)", activities: [
            Activity(name: "조깅", duration: "1시간 30분", calories: 444, fat: 44, icon: "iconJogging", color: .blue)
        ]),
        DayActivity(date: "05.21(수)", activities: [
            Activity(name: "걷기", duration: "1h 20m", calories: 284, fat: 24, icon: "iconWalk", color: .green),
            Activity(name: "조깅", duration: "28m", calories: 102, fat: 13, icon: "iconJogging", color: .blue)
        ]),
        DayActivity(date: "05.20(화)", activities: [
            Activity(name: "걷기", duration: "24m", calories: 42, fat: 18, icon: "iconWalk", color: .green)
        ]),
        DayActivity(date: "05.19(월)", activities: [
            Activity(name: "조깅", duration: "54m", calories: 208, fat: 22, icon: "iconJogging", color: .blue)
        ]),
        DayActivity(date: "05.18(일)", activities: [
            Activity(name: "조깅", duration: "1h 17m", calories: 382, fat: 16, icon: "iconJogging", color: .blue),
            Activity(name: "조깅", duration: "32m", calories: 108, fat: 16, icon: "iconJogging", color: .blue)
        ])
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
                // MARK: - Header
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    // MARK: - Header
                    
                    Spacer()
                        .frame(height: 24)
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Zone2 운동 리포트")
                            .textStyle(.h1)
                            .foregroundStyle(Color.brandColor)
                        
                        Text("지방을 얼마나 불태웠는지 계산해봤어요")
                            .textStyle(.h3)
                            .foregroundColor(Color.gray5)
                    }
                    .padding(.horizontal, 20)
                    Spacer()
                        .frame(height: 24)
                    
                    // MARK: - 월 선택
                    
                    HStack(spacing: 0) {
                        Button(action: {}) {
                            Image(systemName: "chevron.left")
                        }
                        .foregroundStyle(Color.brandColor)
                        .bold()
                        .frame(width: 44, height: 44)
                        Text("5월")
                            .font(.pretendard(.semibold, size: 25))
                            .foregroundStyle(Color.brandColor)
                        Button(action: {}) {
                            Image(systemName: "chevron.right")
                        }
                        .foregroundStyle(Color.brandColor)
                        .bold()
                        .frame(width: 44, height: 44)
                    }
                    .background(Color.brandColor.opacity(0.1))
                    .clipShape(Capsule())
                    .frame(height: 44)
                    .padding(.horizontal, 20)
                    Spacer()
                        .frame(height: 16)
                    
                    // MARK: - 요약
                    
                    HStack(spacing: 0) {
                        SummaryCard(title: "총 시간", value: "12h 39m")
                        Divider()
                            .backgroundStyle(Color.gray5)
                            .frame(width: 1, height: 45)
                        SummaryCard(title: "총 칼로리", value: "1490Kcal")
                        Divider()
                            .backgroundStyle(Color.gray5)
                            .frame(width: 1, height: 45)
                        SummaryCard(title: "Zone2로 뺀 지방", value: "999g")
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(.horizontal, 20)
                    .shadow(color: .gray2, radius: 8, x: 0, y: 4)
                    
                    Spacer()
                        .frame(height: 16)
                }
                .background(Color.init(hex: "5699c3").opacity(0.08))
                
                // MARK: - 날짜별 데이터
                
                VStack(alignment: .leading) {
                    if activitiesByDate.isEmpty {
                        //운동 데이터가 존재하지 않을 경우
                        VStack {
                            Image("bearWhite")
                                .frame(width: 144, height: 144)
                            Spacer()
                                .frame(height: 16)
                            Text("아직 존투비와")
                                .textStyle(.h1)
                            Spacer()
                                .frame(height: 4)
                            Text("함께한 시간이 없어요")
                                .textStyle(.h1)
                            Spacer()
                                .frame(height: 8)
                            Text("운동을 기록하고 리포트를 모아보세요")
                                .textStyle(.p2)
                                .foregroundStyle(Color.gray5)
                        }
                    } else {
                        ForEach(activitiesByDate, id: \.date) { day in
                                //운동 데이터가
                            VStack(alignment: .leading, spacing: 0) {
                                Text(day.date)
                                    .textStyle(.p3)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.gray5)
                                ForEach(day.activities) { activity in
                                    ActivityRow(activity: activity)
                                        .padding(.vertical, 16)
                                        .padding(.leading, 8)
                                        
                                }
                            }
                            .padding(.bottom, 16)
                        }
                    }
                }
                .padding(.vertical, 24)
                .padding(.horizontal, 20)
            }
            .navigationTitle("운동 리포트")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SummaryCard: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 8) {
            Text(title)
                .font(.pretendard(.semibold, size: 14))
                .foregroundColor(Color.gray5)
            Text(value)
                .font(.pretendard(.semibold, size: 18))
                .foregroundColor(Color.black)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(Color.white)
    }
}

struct ActivityRow: View {
    
    let activity: Activity
    
    var body: some View {
        HStack(spacing: 16) {
            
            // MARK: - 운동 이미지
            Image(activity.icon)
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(activity.color)
            
            // MARK: - 운동 설명
            
            VStack(alignment: .leading, spacing: 4) {
                Text("\(activity.name) ")
                    .font(.pretendard(.bold, size: 16))
                +
                Text("\(activity.duration)")
                    .font(.pretendard(.medium, size: 16))
                HStack(spacing: 4) {
                    Text("칼로리")
                        .textStyle(.p3)
                        .foregroundStyle(Color.gray5)
                    Text("\(activity.calories)kcal")
                        .textStyle(.p3)
                        .foregroundStyle(Color.black)
                        .fontWeight(.semibold)
                    Spacer()
                        .frame(width: 38)
                    Text("지방")
                        .textStyle(.p3)
                        .foregroundStyle(Color.gray5)
                    Text("\(activity.fat)g")
                        .textStyle(.p3)
                        .foregroundStyle(Color.black)
                        .fontWeight(.semibold)
                }
            }
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(Color.gray3)
        }
    }
}

struct Activity: Identifiable {
    let id = UUID()
    let name: String
    let duration: String
    let calories: Int
    let fat: Int
    let icon: String
    let color: Color
}

struct DayActivity {
    let date: String
    let activities: [Activity]
}

#Preview {
    ReportView()
}
