//
//  Meals.swift
//  DessertRecipes
//
//  Created by Joanna Rodriguez on 8/1/24.
//

import Foundation


struct Meals: Decodable, Identifiable, Hashable {
    let id: String
    let strMeal: String
    let strMealThumb: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case strMeal = "strMeal"
        case strMealThumb = "strMealThumb"
    }
}

extension Meals {
    static let MOCK_MEALS: [Meals] = [ 
        .init(id: "53049", strMeal: "Apam balik", strMealThumb: "https://www.themealdb.com//images//media//meals//adxcbq1619787919.jpg"),
        .init(id: "52893", strMeal: "Apple & Blackberry Crumble", strMealThumb: "https:/www.themealdb.com//images//media/meals//xvsurr1511719182.jpg"),
        .init(id: "52768", strMeal: "Apple Frangipan Tart", strMealThumb: "https://www.themealdb.com//images//media//meals//wxywrq1468235067.jpg")
        
    ]
}
