//
//  DataController.swift
//  DessertRecipes
//
//  Created by Joanna Rodriguez on 8/2/24.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    

    let container = NSPersistentContainer(name: "FavoriteDesserts")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data failed to load \(error.localizedDescription)")
            }
        }
    }
}
