//
//  WorkOutStartView.swift
//  Zone2Be
//
//  Created by kangChangHyeok on 05/06/2025.
//

import SwiftUI

struct WorkOutStartView: View {
    
    struct Exercise: Identifiable, Hashable {
        let id = UUID()
        let title: String
        let imageName: String // 에셋 이름
    }
    
    let exercises: [Exercise] = [
        .init(title: "걷기", imageName: "walking"),
        .init(title: "조깅", imageName: "jogging"),
        .init(title: "자전거", imageName: "cycle"),
        .init(title: "계단오르기", imageName: "stair"),
        .init(title: "필라테스", imageName: "pilates"),
        .init(title: "등산", imageName: "hiking")
    ]
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Spacer()
                        .frame(height: 44)
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Zone2로 운동하기")
                            .textStyle(.h1)
                            .foregroundColor(Color.blue)
                        
                        Text("최적의 지방연소 심박수 유지를 도와드려요")
                            .textStyle(.h3)
                            .foregroundStyle(Color.gray5)
                    }
                    .padding(.horizontal, 20)
                    Spacer()
                        .frame(height: 32)
                    // Grid
                    LazyVGrid(columns: columns, spacing: 8) {
                        ForEach(exercises) { exercise in
                            NavigationLink(value: exercise) {
                                VStack(spacing: 8) {
                                    Image(exercise.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        
                                    Text(exercise.title)
                                        .font(.pretendard(.semibold, size: 18))
                                        .foregroundColor(.black)
                                        .padding(.bottom, 16)
                                        .padding(.top, 10)
                                }
                                
                                .padding()
                                .background(Color.white)
                                .cornerRadius(8)
                                .shadow(color: Color.gray.opacity(0.1), radius: 4, x: 0, y: 2)
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .navigationDestination(for: Exercise.self) { exercise in
                        WorkoutView()
                            .navigationBarBackButtonHidden(true)
                    }
                    Spacer()
                }
                .background(Color.init(hex: "#FAFCFF"))
                .navigationTitle("운동하기")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    WorkOutStartView()
}
