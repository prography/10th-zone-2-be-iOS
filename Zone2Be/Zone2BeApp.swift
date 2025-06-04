//
//  Zone2BeApp.swift
//  Zone2Be
//
//  Created by kangChangHyeok on 29/05/2025.
//

import SwiftUI

@main
struct Zone2BeApp: App {
    
    @State private var isfirstLaunch = false
    let isLoggedIn = false
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            if isfirstLaunch {
                LoginSelectView()
            } else {
                SplashView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            isfirstLaunch = true
                        }
                    }
            }
        }
    }
}
