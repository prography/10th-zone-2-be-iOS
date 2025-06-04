//
//  splashView.swift
//  Zone2Be
//
//  Created by kangChangHyeok on 03/06/2025.
//

import SwiftUI

struct SplashView: View {
    
    @State private var appear = false
    
    var body: some View {
        ZStack {
            Image("splash")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
                Text("가성비 있게 운동하자")
                    .textStyle(.h1)
                    .foregroundStyle(.white)
                    .opacity(appear ? 1 : 0)
                    .offset(y: appear ? 0 : 20)
                    .animation(.easeOut(duration: 0.5), value: appear)
                    .onAppear {
                        appear = true
                    }
                Text("zone to be")
                    .font(.rota(.bold, size: 40))
                    .foregroundStyle(.white)
                    .opacity(appear ? 1 : 0)
                    .offset(y: appear ? 0 : 20)
                    .animation(.easeOut(duration: 0.5), value: appear)
                    .onAppear {
                        appear = true
                    }
                Spacer()
            }
            .padding(.top, 231)
        }
    }
}

#Preview {
    SplashView()
}
