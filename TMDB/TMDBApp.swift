//
//  TMDBApp.swift
//  TMDB
//
//  Created by Jeeva Tamil on 05/09/22.
//

import SwiftUI

@main
struct TMDBApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
