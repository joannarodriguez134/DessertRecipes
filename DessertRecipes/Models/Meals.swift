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
        .init(id: "52768", strMeal: "Apple Frangipan Tart", strMealThumb: "https://www.themealdb.com//images//media//meals//wxywrq1468235067.jpg"),
        .init(id: "52923", strMeal: "Canadian Butter Tarts", strMealThumb: "https://www.themealdb.com//images//media//meals//wpputp1511812960.jpg"),
        .init(id: "52855", strMeal: "Banana Pancakes", strMealThumb: "https://www.themealdb.com//images//media//meals//sywswr1511383814.jpg"),
        .init(id: "52910", strMeal: "Chinon Apple Tarts", strMealThumb: "https://www.themealdb.com//images//media//meals//qtqwwu1511792650.jpg"),
        .init(id: "53007", strMeal: "Honey Yogurt Cheesecake", strMealThumb: "https://www.themealdb.com//images//media//meals//y2irzl1585563479.jpg"),
        .init(id: "52787", strMeal: "Hot Chocolate Fudge", strMealThumb: "https://www.themealdb.com//images//media//meals//xrysxr1483568462.jpg")
        
    ]
}
