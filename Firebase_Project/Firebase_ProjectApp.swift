//
//  Firebase_ProjectApp.swift
//  Firebase_Project
//
//  Created by Ziloliddin Kamolov on 03/02/23.
//

import SwiftUI
import CoreData
import Firebase

@main
struct Firebase_ProjectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            StarterScreen()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
