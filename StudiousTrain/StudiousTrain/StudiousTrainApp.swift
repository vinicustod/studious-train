//
//  StudiousTrainApp.swift
//  StudiousTrain
//
//  Created by vinicius.custodio on 02/04/21.
//

import SwiftUI

@main
struct StudiousTrainApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
