//
//  DessertService.swift
//  DessertRecipes
//
//  Created by Joanna Rodriguez on 8/1/24.
//

import Foundation

@MainActor
class DessertService: ObservableObject {
    var mealList = [Meals]()

    
    func fetchDesserts() async -> [Meals] {
        
        if let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            
            
            do {
                let (data, _) = try await URLSession.shared.data(for: request)
                
                let decoder = JSONDecoder()
                let mealsDict = try decoder.decode([String: [Meals]].self, from: data)
                mealList = mealsDict["meals"]!

                
                print("Total desserts count: \(mealList.count)")
                
                for meal in mealList {
                    print("Meal ID: \(meal.id)")
                    
                }
                return mealList

                
            } catch {
                print("Error fetching meals: \(error)")
            }
        }
        return []
        
    }
    
    func fetchDessertsById(idMeal: String) async -> Recipes? {
            if let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(idMeal)") {
                var request = URLRequest(url: url)
                request.httpMethod = "GET"

                do {
                    let (data, _) = try await URLSession.shared.data(for: request)
                    let decoder = JSONDecoder()
                    let result = try decoder.decode([String: [Recipes]].self, from: data)
                    return result["meals"]?.first
                } catch {
                    print("Error fetching recipe by ID: \(error)")
                }
            }
            return nil
        }

}
