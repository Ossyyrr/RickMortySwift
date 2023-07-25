//
//  RickMortyApp.swift
//  RickMorty
//
//  Created by Patricia Manzanero on 25/7/23.
//

import SwiftUI

@main
struct RickMortyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
