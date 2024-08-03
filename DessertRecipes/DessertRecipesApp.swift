//
//  DessertRecipesApp.swift
//  DessertRecipes
//
//  Created by Joanna Rodriguez on 8/1/24.
//

import SwiftUI

@main
struct DessertRecipesApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            let service = DessertService()
            MainTabView()
                .environmentObject(service)
                .environment(\.managedObjectContext, dataController.container.viewContext)
            
        }
    }
}
