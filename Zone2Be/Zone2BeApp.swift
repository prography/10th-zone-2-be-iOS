//
//  Zone2BeApp.swift
//  Zone2Be
//
//  Created by kangChangHyeok on 29/05/2025.
//

import SwiftUI

@main
struct Zone2BeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
