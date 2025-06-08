//
//  MainView.swift
//  Zone2Be
//
//  Created by kangChangHyeok on 05/06/2025.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            Tab("운동하기", image: "shoe") {
                WorkOutStartView()
            }
            
            Tab("리포트", image: "report") {
                ReportView()
            }
            Tab("마이페이지", image: "rightHeartUser") {
                MyInfoView()
            }
        }
        .tint(.brandColor)
    }
}

#Preview {
    MainView()
}
