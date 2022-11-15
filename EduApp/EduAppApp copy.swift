//
//  EduAppApp.swift
//  EduApp
//
//  Created by alaa gharbi on 9/11/2022.
//

import SwiftUI

@main
struct EduAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
